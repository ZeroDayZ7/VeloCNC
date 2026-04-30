import 'package:cnc_toolbox/core/theme/app_colors.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SafetyAlertWidget extends StatelessWidget {
  final String alertKey;

  const SafetyAlertWidget({super.key, required this.alertKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacings.m),
      child: Container(
        padding: AppSpacings.edgeInsetsMs,
        decoration: BoxDecoration(
          color: AppColors.statusWarning.withValues(alpha: 0.1),
          borderRadius: AppRadii.radiusM,
          border: Border.all(color: AppColors.statusWarning),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: AppColors.statusWarning,
            ),
            AppSpacings.gapMs,
            Expanded(
              child: Text(
                alertKey.tr(),
                style: const TextStyle(
                  color: AppColors.statusWarning,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
