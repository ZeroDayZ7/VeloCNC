import 'package:cnc_toolbox/core/app/bootstrap_handler.dart';
import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/localization/locale_notifier.dart';
import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:cnc_toolbox/core/theme/theme_data.dart';
import 'package:cnc_toolbox/core/theme/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The root widget of the application.
///
/// Responsibility:
/// - Configures the global [MaterialApp.router].
/// - Synchronizes app-wide providers like [routerProvider], [themeProvider], and localization.
/// - Wraps the application in [AppBootstrapHandler] to manage initialization states.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch core providers to trigger rebuilds on global state changes
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    // Localization is tracked to ensure UI reflects language changes immediately
    ref.watch(localeProvider);

    return MaterialApp.router(
      title: AppInfo.appName,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      themeMode: themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      builder: (context, child) {
        // Intercepts the build process to show Splash Screen or Error Screen during startup
        return AppBootstrapHandler(child: child!);
      },
    );
  }
}
