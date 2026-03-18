import 'package:cnc_toolbox/core/local_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    final repo = ref.watch(localSettingsRepositoryProvider);
    return repo.getIsDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme(bool isDark) async {
    state = isDark ? ThemeMode.dark : ThemeMode.light;
    await ref.read(localSettingsRepositoryProvider).setIsDarkMode(isDark);
  }
}
