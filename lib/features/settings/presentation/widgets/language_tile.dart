import 'package:cnc_toolbox/core/localization/app_languages.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:cnc_toolbox/features/settings/presentation/widgets/language_picker.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentLocale = context.locale;

    final currentLanguage = AppLanguage.values.firstWhere(
      (l) => l.locale.languageCode == currentLocale.languageCode,
      orElse: () => AppLanguage.polish,
    );

    return ListTile(
      leading: Text(currentLanguage.flag, style: const TextStyle(fontSize: 22)),
      title: Text(currentLanguage.name),
      subtitle: Text(LocaleKeys.change_language_desc.tr()),
      trailing: null,

      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: theme.colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (_) => const LanguagePicker(),
      ),
    );
  }
}
