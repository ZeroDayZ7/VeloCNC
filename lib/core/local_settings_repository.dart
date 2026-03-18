import 'dart:convert';

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/shared_prefs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_settings_repository.g.dart';

@Riverpod(keepAlive: true)
LocalSettingsRepository localSettingsRepository(Ref ref) {
  final prefs = ref.watch(sharedPrefsProvider);
  return LocalSettingsRepository(prefs);
}

class LocalSettingsRepository {
  final SharedPreferences _prefs;
  LocalSettingsRepository(this._prefs);

  // --- THEME ---
  bool getIsDarkMode() => _prefs.getBool(PreferencesKeys.isDarkMode) ?? false;
  Future<void> setIsDarkMode(bool value) =>
      _prefs.setBool(PreferencesKeys.isDarkMode, value);

  // --- SIDEBAR ---
  bool getSidebarExpanded() =>
      _prefs.getBool(PreferencesKeys.sidebarExpanded) ?? true;
  Future<void> setSidebarExpanded(bool value) =>
      _prefs.setBool(PreferencesKeys.sidebarExpanded, value);

  // --- CONVERTER UNITS ---
  Map<String, List<String>> getVisibleUnits() {
    final Map<String, List<String>> unitsMap = {};
    for (final key in _prefs.getKeys()) {
      if (key.startsWith(PreferencesKeys.unitsKeyPrefix)) {
        final category = key.replaceFirst(PreferencesKeys.unitsKeyPrefix, '');
        final jsonString = _prefs.getString(key);
        if (jsonString != null) {
          final List decoded = jsonDecode(jsonString);
          unitsMap[category] = decoded.cast<String>();
        }
      }
    }
    return unitsMap;
  }

  Future<void> setVisibleUnits(String category, List<String> unitIds) async {
    final key = '${PreferencesKeys.unitsKeyPrefix}$category';
    await _prefs.setString(key, jsonEncode(unitIds));
  }
}
