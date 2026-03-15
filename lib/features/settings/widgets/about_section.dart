import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  void _showAppInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('about'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${'version'.tr()}: ${AppInfo.appVersion}'),
            const SizedBox(height: 8),
            const Text('Contact: support@velocnc.com'),
            const SizedBox(height: 4),
            const Text('Website: https://velocnc.com'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('close'.tr()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${'version'.tr()}: ${AppInfo.appVersion}'),
      subtitle: Text('about_desc'.tr()),
      leading: const Icon(Icons.info_outline),
      onTap: () => _showAppInfo(context),
    );
  }
}
