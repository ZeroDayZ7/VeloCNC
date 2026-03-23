import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/localization/locale_notifier.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cnc_toolbox/features/settings/presentation/widgets/about_section.dart';
import 'package:cnc_toolbox/features/settings/presentation/widgets/dark_mode_switch.dart';
import 'package:cnc_toolbox/features/settings/presentation/widgets/language_tile.dart';
import 'package:cnc_toolbox/features/settings/presentation/widgets/settings_group.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.settings.tr())),
      body: ListView(
        padding: AppSpacings.edgeInsetsM,
        children: [
          SettingsGroup(
            title: LocaleKeys.appearance.tr(),
            children: const [DarkModeSwitch()],
          ),

          SettingsGroup(
            title: LocaleKeys.language.tr(),
            children: const [LanguageTile()],
          ),

          SettingsGroup(
            title: LocaleKeys.preferences.tr(),
            children: [
              _buildSimpleTile(
                context,
                icon: Icons.straighten,
                title: LocaleKeys.unit_system.tr(),
                subtitle: LocaleKeys.unit_system_desc.tr(),
              ),
              const Divider(indent: 56, height: 1),
              _buildSimpleTile(
                context,
                icon: Icons.notifications_none,
                title: LocaleKeys.notifications.tr(),
                subtitle: LocaleKeys.notifications_desc.tr(),
              ),
            ],
          ),

          SettingsGroup(
            title: LocaleKeys.about.tr(),
            children: const [AboutSection()],
          ),

          AppSpacings.gapL,
        ],
      ),
    );
  }

  Widget _buildSimpleTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: () {}, // Tu dodasz nawigację w przyszłości
    );
  }
}
