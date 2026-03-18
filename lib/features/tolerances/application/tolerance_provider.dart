import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/tolerance_models.dart';
import 'tolerance_service.dart';

part 'tolerance_provider.g.dart';

@Riverpod(keepAlive: true)
Future<ToleranceService> toleranceService(Ref ref) async {
  final jsonString = await rootBundle.loadString('assets/data/tolerances.json');
  final Map<String, dynamic> decoded = json.decode(jsonString);

  Map<String, List<ToleranceRange>> parse(Map<String, dynamic>? section) {
    if (section == null) return {};
    return section.map(
      (grade, ranges) => MapEntry(
        grade,
        (ranges as List).map((e) => ToleranceRange.fromJson(e)).toList(),
      ),
    );
  }

  final data = {
    ToleranceType.hole: parse(decoded['holes']),
    ToleranceType.shaft: parse(decoded['shafts']),
  };

  return ToleranceService(data);
}
