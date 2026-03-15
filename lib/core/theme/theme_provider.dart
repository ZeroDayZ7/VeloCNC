import 'package:cnc_toolbox/core/shared_prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  static const _themeKey = 'isDarkMode';

  @override
  ThemeMode build() {
    // To jest bezpieczne, bo robimy override w bootstrap
    final prefs = ref.watch(sharedPrefsProvider);
    final isDark = prefs.getBool(_themeKey) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme(bool isDark) async {
    final prefs = ref.read(sharedPrefsProvider);
    state = isDark ? ThemeMode.dark : ThemeMode.light;
    await prefs.setBool(_themeKey, isDark);
  }
}
