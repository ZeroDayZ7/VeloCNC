import 'dart:convert';

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tolerance_repository.g.dart';

/// Interfejs dla repozytorium tolerancji
abstract class IToleranceRepository {
  Future<Map<ToleranceType, Map<String, List<ToleranceRange>>>>
  loadTolerances();
}

/// Implementacja oparta na pliku JSON z Assetów
class ToleranceRepository implements IToleranceRepository {
  @override
  Future<Map<ToleranceType, Map<String, List<ToleranceRange>>>>
  loadTolerances() async {
    final jsonString = await rootBundle.loadString(AppAssets.tolerancesJson);
    final Map<String, dynamic> decoded =
        json.decode(jsonString) as Map<String, dynamic>;

    return {
      ToleranceType.hole: _parseSection(
        decoded['holes'] as Map<String, dynamic>?,
      ),
      ToleranceType.shaft: _parseSection(
        decoded['shafts'] as Map<String, dynamic>?,
      ),
    };
  }

  Map<String, List<ToleranceRange>> _parseSection(
    Map<String, dynamic>? section,
  ) {
    if (section == null) return {};

    return section.map((grade, ranges) {
      final list = (ranges as List?) ?? [];
      return MapEntry(
        grade,
        list
            .map((e) => ToleranceRange.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    });
  }
}

@Riverpod(keepAlive: true)
IToleranceRepository toleranceRepository(Ref ref) {
  return ToleranceRepository();
}
