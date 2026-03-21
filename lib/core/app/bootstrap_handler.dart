import 'package:cnc_toolbox/core/app/app_init_provider.dart';
import 'package:cnc_toolbox/core/app/presentation/error_app.dart';
import 'package:cnc_toolbox/core/app/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A gatekeeper widget that manages the initial application state.
///
/// It listens to [appInitProvider] and switches between:
/// - [SplashScreen] while resources are loading.
/// - [ErrorApp] if initialization fails (e.g., database or assets error).
/// - The main application [child] once bootstrap is successful.
class AppBootstrapHandler extends ConsumerWidget {
  final Widget child;
  const AppBootstrapHandler({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initAsync = ref.watch(appInitProvider);

    return initAsync.when(
      // Bootstrap successful - reveal the application
      data: (_) => child,

      // Warm-up in progress - show branded splash screen
      loading: () => const SplashScreen(),

      // Critical failure - show error screen with recovery (retry) option
      error: (error, stack) => ErrorApp(
        error: error.toString(),
        onRetry: () => ref.invalidate(appInitProvider),
      ),
    );
  }
}
