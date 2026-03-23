import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:flutter/material.dart';

class CncDrawerHeader extends StatelessWidget {
  const CncDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DrawerHeader(
      decoration: BoxDecoration(
        color: theme.primaryColor.withValues(alpha: 0.1),
        border: const Border(
          bottom: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.precision_manufacturing,
              size: 40,
              color: Colors.blueAccent,
            ),
            AppSpacings.gapMs,
            Text(
              AppInfo.appName,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
