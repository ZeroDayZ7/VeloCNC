import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GCodeTile extends StatelessWidget {
  final GCodeViewModel code;

  const GCodeTile({super.key, required this.code});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ExpansionTile(
        title: Text(
          code.code,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(code.title),
        children: [
          Padding(
            padding: AppSpacings.edgeInsetsMs,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(code.description),
                AppSpacings.gapS,
                Text(
                  "${LocaleKeys.gcodes_example.tr()}:",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(code.example),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
