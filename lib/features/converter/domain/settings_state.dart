// lib/features/converter/domain/settings_state.dart
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

/// Represents the global UI and configuration state of the application.
///
/// This state persists user preferences such as layout choices and
/// customized visibility of conversion units across different categories.
@freezed
sealed class SettingsState with _$SettingsState {
  /// Default factory for [SettingsState].
  const factory SettingsState({
    /// Determines if the navigation sidebar is in its full or collapsed state.
    @Default(true) bool isSidebarExpanded,

    /// A map of user-selected visible units where the key is the category ID
    /// and the value is a list of enabled [UnitDefinition] IDs.
    @Default({}) Map<String, List<String>> visibleUnits,
  }) = _SettingsState;

  // Added private constructor to allow defining custom methods in a Freezed class.
  const SettingsState._();

  /// Checks if a specific unit should be displayed in the UI.
  ///
  /// Returns `true` if the unit is explicitly enabled or if no
  /// preferences have been set for the [categoryId] yet (defaulting to "show all").
  bool isUnitVisible(String categoryId, String unitId) {
    final current = visibleUnits[categoryId];
    if (current == null || current.isEmpty) return true;
    return current.contains(unitId);
  }

  /// Returns a filtered list of [UnitDefinition] for a given [category].
  ///
  /// This ensures the UI only renders units that the user has selected
  /// in the settings, providing a clean and personalized experience.
  /// If no specific units are selected, it returns the full list of available units.
  List<UnitDefinition> getVisibleUnitsForCategory(ConverterCategory category) {
    final activeIds = visibleUnits[category.id.name];

    if (activeIds == null || activeIds.isEmpty) {
      return category.units;
    }

    return category.units.where((u) => activeIds.contains(u.id)).toList();
  }
}
