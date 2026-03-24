import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:flutter/material.dart';

class CncResultCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;

  const CncResultCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = backgroundColor ?? theme.colorScheme.primaryContainer;
    final fColor = textColor ?? theme.colorScheme.onPrimaryContainer;

    return Container(
      width: double.infinity,
      padding: AppSpacings.edgeInsetsL,
      decoration: BoxDecoration(color: bgColor, borderRadius: AppRadii.radiusL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 16, color: fColor.withValues(alpha: 0.7)),
                const SizedBox(width: 8),
              ],
              Text(
                title,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: fColor.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: fColor,
              fontSize: 32,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: fColor.withValues(alpha: 0.9),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
