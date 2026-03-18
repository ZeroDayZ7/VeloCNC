import 'package:cnc_toolbox/core/local_settings_repository.dart';
import 'package:cnc_toolbox/features/converter/domain/settings_state.dart'; // Import nowego stanu
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'converter_settings_provider.g.dart';

@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  SettingsState build() {
    final repo = ref.watch(localSettingsRepositoryProvider);

    return SettingsState(
      isSidebarExpanded: repo.getSidebarExpanded(),
      visibleUnits: repo.getVisibleUnits(),
    );
  }

  Future<void> toggleSidebar() async {
    final repo = ref.read(localSettingsRepositoryProvider);
    final newValue = !state.isSidebarExpanded;

    state = state.copyWith(isSidebarExpanded: newValue);
    await repo.setSidebarExpanded(newValue);
  }

  Future<void> toggleUnit(String category, String unitId) async {
    final repo = ref.read(localSettingsRepositoryProvider);

    final current = state.visibleUnits[category] ?? [];
    final updated = current.contains(unitId)
        ? current.where((e) => e != unitId).toList()
        : [...current, unitId];

    state = state.copyWith(
      visibleUnits: {...state.visibleUnits, category: updated},
    );

    await repo.setVisibleUnits(category, updated);
  }
}
