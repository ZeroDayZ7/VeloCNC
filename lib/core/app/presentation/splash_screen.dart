import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppScaffold(
      scrollable: false,
      useSafeArea: true,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppInfo.appName.toUpperCase(),
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 36,
                fontWeight: FontWeight.w900,
                letterSpacing: 6,
              ),
            ),
            AppSpacings.gapHuge,
            const SpinKitFoldingCube(color: Colors.blueAccent, size: 35.0),
            AppSpacings.gapHuge,

            AppSpacings.gapMs,
            Opacity(
              opacity: 0.4,
              child: Text(
                'VERSION ${AppInfo.appVersion}',
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 12,
                  // ...
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
