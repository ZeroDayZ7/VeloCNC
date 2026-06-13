import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeSwitch extends ConsumerWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(
      themeProvider.select((mode) => mode == ThemeMode.dark),
    );

    return SwitchListTile(
      secondary: const Icon(Icons.dark_mode_outlined),
      title: Text(LocaleKeys.dark_mode.tr()),
      subtitle: Text(LocaleKeys.dark_mode_desc.tr()),
      value: isDarkMode,
      onChanged: (val) => ref.read(themeProvider.notifier).toggleTheme(val),
    );
  }
}
