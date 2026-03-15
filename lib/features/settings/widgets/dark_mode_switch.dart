import 'package:cnc_toolbox/core/theme/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeSwitch extends ConsumerWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = themeMode == ThemeMode.dark;

    return SwitchListTile(
      title: Text('dark_mode'.tr()),
      subtitle: Text('dark_mode_desc'.tr()),
      value: isDarkMode,
      onChanged: (val) => themeNotifier.toggleTheme(val),
    );
  }
}
