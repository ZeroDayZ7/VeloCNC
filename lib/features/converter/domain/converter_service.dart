import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';

import '../models/unit_model.dart';

class ConverterService {
  static Map<String, String> calculateValues({
    required String sourceUnitId,
    required String inputValue,
    required double numericValue,
    required List<UnitDefinition> allUnits,
  }) {
    // 1. Znajdź jednostkę wejściową
    final sourceUnit = allUnits.firstWhere((u) => u.id == sourceUnitId);

    // 2. Przelicz na wartość bazową
    final baseValue = sourceUnit.toBase(numericValue);

    final Map<String, String> newValues = {};

    // 3. Przelicz na resztę
    for (final unit in allUnits) {
      if (unit.id == sourceUnitId) {
        newValues[unit.id] =
            inputValue;
      } else {
        final converted = unit.fromBase(baseValue);
        newValues[unit.id] = AppNumberFormatter.format(converted);
      }
    }

    return newValues;
  }
}
