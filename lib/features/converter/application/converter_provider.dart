// lib/features/converter/application/converter_provider.dart
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/features/converter/domain/converter_state.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'converter_provider.g.dart';

@Riverpod(keepAlive: true)
class ConverterNotifier extends _$ConverterNotifier {
  @override
  ConverterState build(ConverterCategory category) => const ConverterState();

  void updateValue(String unitId, String value, List<UnitDefinition> allUnits) {
    if (value.isEmpty) {
      state = state.copyWith(values: {});
      return;
    }

    final inputValue = AppNumberFormatter.tryParse(value);
    if (inputValue == null) return;

    // 1. Znajdź jednostkę, z której użytkownik wpisuje dane
    final sourceUnit = allUnits.firstWhere((u) => u.id == unitId);

    // 2. Przelicz na wartość bazową (np. mm, Celsius, Bar)
    final baseValue = sourceUnit.toBase(inputValue);

    final Map<String, String> newValues = {};

    // 3. Przelicz na wszystkie inne jednostki używając ich fromBase
    for (final unit in allUnits) {
      if (unit.id == unitId) {
        newValues[unit.id] = value; // Zachowaj to, co wpisał user
      } else {
        final converted = unit.fromBase(baseValue);
        newValues[unit.id] = AppNumberFormatter.format(converted);
      }
    }

    state = state.copyWith(values: newValues);
  }
}
