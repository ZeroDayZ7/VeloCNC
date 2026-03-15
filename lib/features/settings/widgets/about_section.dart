import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/localization/locale_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  void _showAppInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.about.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${LocaleKeys.version.tr()}: ${AppInfo.appVersion}'),
            const SizedBox(height: 8),
            Text('${LocaleKeys.contact.tr()}: ${AppInfo.contactEmail}'),
            const SizedBox(height: 4),
            Text('${LocaleKeys.website.tr()}: ${AppInfo.websiteUrl}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.close.tr()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);

    return ListTile(
      title: Text('${LocaleKeys.version.tr()}: ${AppInfo.appVersion}'),
      subtitle: Text(LocaleKeys.about_desc.tr()),
      leading: const Icon(Icons.info_outline),
      onTap: () => _showAppInfo(context),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.1),
    );
  }
}
