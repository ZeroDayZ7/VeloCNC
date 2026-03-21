// lib/features/converter/application/converter_provider.dart
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/features/converter/domain/converter_service.dart';
import 'package:cnc_toolbox/features/converter/domain/converter_state.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'converter_provider.g.dart';

/// Manage state and business logic for unit conversion within a specific category.
///
/// Uses a [keepAlive] strategy to preserve user inputs when navigating
/// between different converter categories or app settings.
@Riverpod(keepAlive: true)
class ConverterNotifier extends _$ConverterNotifier {
  @override
  /// Initializes an empty conversion state for the given [category].
  ConverterState build(ConverterCategory category) => const ConverterState();

  /// Orchestrates the conversion process when a user modifies an input field.
  ///
  /// [unitId] represents the unit being edited (the "source" of truth).
  /// [value] is the raw string input from the TextField.
  /// [allUnits] provides the definitions needed for cross-unit calculations.
  void updateValue(String unitId, String value, List<UnitDefinition> allUnits) {
    // Immediate reset for empty inputs to clear the UI
    if (value.isEmpty) {
      state = state.copyWith(values: {});
      return;
    }

    // Locale-aware parsing; if input is invalid (e.g., non-numeric), stop processing
    final inputValue = AppNumberFormatter.tryParse(value);
    if (inputValue == null) return;

    // Delegate mathematical transformations to the domain service
    final newValues = ConverterService.calculateValues(
      sourceUnitId: unitId,
      inputValue: value,
      numericValue: inputValue,
      allUnits: allUnits,
    );

    // Push the updated map of values to the UI
    state = state.copyWith(values: newValues);
  }
}
