import 'package:cnc_toolbox/core/app/app_init_provider.dart';
import 'package:cnc_toolbox/core/app/presentation/error_app.dart';
import 'package:cnc_toolbox/core/app/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBootstrapHandler extends ConsumerWidget {
  final Widget child;
  const AppBootstrapHandler({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initAsync = ref.watch(appInitProvider);

    return initAsync.when(
      data: (_) => child,
      loading: () => const SplashScreen(),
      error: (error, stack) => ErrorApp(
        error: error.toString(),
        onRetry: () => ref.invalidate(appInitProvider),
      ),
    );
  }
}
