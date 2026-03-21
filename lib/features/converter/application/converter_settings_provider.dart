import 'package:cnc_toolbox/core/local_settings_repository.dart';
import 'package:cnc_toolbox/features/converter/domain/settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'converter_settings_provider.g.dart';

/// Notifier responsible for managing UI-related preferences and configuration.
///
/// It acts as a bridge between the [LocalSettingsRepository] and the UI,
/// ensuring that layout and visibility settings are persisted across sessions.
@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  /// Initializes the settings state from local storage.
  ///
  /// Watches [localSettingsRepositoryProvider] to ensure the state stays
  /// in sync with the underlying storage layer.
  SettingsState build() {
    final repo = ref.watch(localSettingsRepositoryProvider);

    return SettingsState(
      isSidebarExpanded: repo.getSidebarExpanded(),
      visibleUnits: repo.getVisibleUnits(),
    );
  }

  /// Toggles the navigation sidebar expansion state and persists the change.
  Future<void> toggleSidebar() async {
    final repo = ref.read(localSettingsRepositoryProvider);
    final newValue = !state.isSidebarExpanded;

    // Update UI state immediately for better responsiveness
    state = state.copyWith(isSidebarExpanded: newValue);

    // Background persistence
    await repo.setSidebarExpanded(newValue);
  }

  /// Adds or removes a unit from the visible list for a specific [category].
  ///
  /// Uses immutable collection updates to ensure [Riverpod] correctly
  /// detects state changes and triggers UI rebuilds.
  Future<void> toggleUnit(String category, String unitId) async {
    final repo = ref.read(localSettingsRepositoryProvider);

    final current = state.visibleUnits[category] ?? [];

    // Toggle logic: remove if exists, add if missing
    final updated = current.contains(unitId)
        ? current.where((e) => e != unitId).toList()
        : [...current, unitId];

    // Create a new map reference to trigger a state update
    state = state.copyWith(
      visibleUnits: {...state.visibleUnits, category: updated},
    );

    // Persist the updated unit list to local storage
    await repo.setVisibleUnits(category, updated);
  }
}
