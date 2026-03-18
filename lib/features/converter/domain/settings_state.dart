// lib/features/converter/domain/settings_state.dart
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(true) bool isSidebarExpanded,
    @Default({}) Map<String, List<String>> visibleUnits,
  }) = _SettingsState;

  const SettingsState._();

  bool isUnitVisible(String categoryId, String unitId) {
    final current = visibleUnits[categoryId];
    if (current == null || current.isEmpty) return true;
    return current.contains(unitId);
  }

  // POPRAWKA: Zmieniamy ConverterGroup na ConverterCategory
  List<UnitDefinition> getVisibleUnitsForCategory(ConverterCategory category) {
    final activeIds = visibleUnits[category.id.name];

    if (activeIds == null || activeIds.isEmpty) {
      return category.units;
    }

    return category.units.where((u) => activeIds.contains(u.id)).toList();
  }
}
