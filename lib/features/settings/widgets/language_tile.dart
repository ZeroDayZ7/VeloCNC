import 'package:cnc_toolbox/core/localization/app_languages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'language_picker.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key});

  void _showLanguagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => const LanguagePicker(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Wyciągamy dane o aktualnym języku na podstawie locale z contextu
    final currentLocale = context.locale;
    final currentLanguage = AppLanguage.values.firstWhere(
      (l) => l.locale.languageCode == currentLocale.languageCode,
      orElse: () => AppLanguage.polish,
    );

    return ListTile(
      title: Text(currentLanguage.name),
      leading: Text(currentLanguage.flag, style: const TextStyle(fontSize: 20)),
      subtitle: Text('change_language_desc'.tr()),
      onTap: () => _showLanguagePicker(context),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Theme.of(
        context,
      ).colorScheme.primaryContainer.withValues(alpha: 0.1),
    );
  }
}
