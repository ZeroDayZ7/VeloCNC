// lib/features/converter/application/converter_provider.dart
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/features/converter/domain/converter_service.dart';
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

    final newValues = ConverterService.calculateValues(
      sourceUnitId: unitId,
      inputValue: value,
      numericValue: inputValue,
      allUnits: allUnits,
    );

    state = state.copyWith(values: newValues);
  }
}
