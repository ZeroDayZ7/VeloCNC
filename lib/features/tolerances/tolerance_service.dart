import 'dart:convert';

import 'package:flutter/services.dart';

enum ToleranceType { hole, shaft }

class ToleranceService {
  static Map<ToleranceType, Map<String, List<_ToleranceRange>>>? _data;

  static bool get isLoaded => _data != null;

  static Future<void> init() async {
    if (_data != null) return;

    try {
      final jsonString = await rootBundle.loadString(
        'assets/data/tolerances.json',
      );
      final Map<String, dynamic> decoded = json.decode(jsonString);

      _data = {
        ToleranceType.hole: _parseSection(decoded['holes']),
        ToleranceType.shaft: _parseSection(decoded['shafts']),
      };
    } catch (e) {
      _data = {ToleranceType.hole: {}, ToleranceType.shaft: {}};
    }
  }

  static Map<String, List<_ToleranceRange>> _parseSection(
    Map<String, dynamic>? section,
  ) {
    if (section == null) return {};
    return section.map(
      (grade, ranges) => MapEntry(
        grade,
        (ranges as List).map((e) => _ToleranceRange.fromJson(e)).toList(),
      ),
    );
  }

  /// Pobiera dostępne litery (np. H, G, Js lub h, g, f)
  static List<String> getLetters(ToleranceType type) {
    if (_data == null) return [];
    return _data![type]!.keys
        .map((e) => e.replaceAll(RegExp(r'[0-9]'), ''))
        .toSet()
        .toList()
      ..sort();
  }

  /// Pobiera dostępne cyfry dla konkretnej litery (np. 6, 7, 8 dla H)
  static List<String> getNumbersForLetter(ToleranceType type, String letter) {
    if (_data == null) return [];
    return _data![type]!.keys
        .where((e) => e.startsWith(letter))
        .map((e) => e.replaceFirst(letter, ''))
        .toList()
      ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
  }

  static ToleranceResult? calculate(
    double diameter,
    String letter,
    String number,
    ToleranceType type,
  ) {
    if (_data == null) return null;
    final grade = '$letter$number';
    final ranges = _data![type]![grade];
    if (ranges == null) return null;

    for (final range in ranges) {
      if (diameter >= range.min && diameter <= range.max) {
        return ToleranceResult(
          upperDeviation: range.upper,
          lowerDeviation: range.lower,
          minSize: diameter + range.lower,
          maxSize: diameter + range.upper,
          restrictionKey: range.restrictionKey,
          infoKey: range.infoKey,
        );
      }
    }
    return null;
  }
}

class _ToleranceRange {
  final double min, max, upper, lower;
  final String? restrictionKey;
  final String? infoKey;
  const _ToleranceRange({
    required this.min,
    required this.max,
    required this.upper,
    required this.lower,
    this.restrictionKey,
    this.infoKey,
  });

  factory _ToleranceRange.fromJson(Map<String, dynamic> json) =>
      _ToleranceRange(
        min: (json['min'] as num).toDouble(),
        max: (json['max'] as num).toDouble(),
        upper: (json['upper'] as num).toDouble(),
        lower: (json['lower'] as num).toDouble(),
        restrictionKey: json['restriction_key'] as String?,
        infoKey: json['info_key'] as String?,
      );
}

class ToleranceResult {
  final double upperDeviation, lowerDeviation, minSize, maxSize;
  final String? restrictionKey;
  final String? infoKey;
  const ToleranceResult({
    required this.upperDeviation,
    required this.lowerDeviation,
    required this.minSize,
    required this.maxSize,
    this.restrictionKey,
    this.infoKey,
  });
}
