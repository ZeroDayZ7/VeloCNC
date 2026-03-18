import 'package:cnc_toolbox/features/home/presentation/not_found_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Importy podstron
import '../../features/converter/converter_page.dart';
import '../../features/cutting_speed/cutting_speed_page.dart';
import '../../features/feed_rate/feed_rate_page.dart';
import '../../features/g_codes/presentation/g_codes_page.dart';
import '../../features/gd&t_symbols/data/symbols_data.dart';
import '../../features/gd&t_symbols/presentation/symbol_details_page.dart';
import '../../features/gd&t_symbols/presentation/symbols_page.dart';
import '../../features/home/home_page.dart';
import '../../features/settings/settings_page.dart';
import '../../features/spindle_speed/spindle_speed_page.dart';
import '../../features/tap_drill/tap_drill_page.dart';
import '../../features/tolerances/tolerance_page.dart';

part 'app_router.g.dart';

// --- DEFINICJA GŁÓWNA ---
@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<SettingsRoute>(path: 'settings'),
    TypedGoRoute<CuttingSpeedRoute>(path: 'cutting-speed'),
    TypedGoRoute<FeedRateRoute>(path: 'feed-rate'),
    TypedGoRoute<SpindleSpeedRoute>(path: 'spindle-speed'),
    TypedGoRoute<TapDrillRoute>(path: 'tap-drill'),
    TypedGoRoute<ConverterRoute>(path: 'converter'),
    TypedGoRoute<TolerancesRoute>(path: 'tolerances'),
    TypedGoRoute<GCodesRoute>(path: 'g-codes'),
    TypedGoRoute<GdSymbolsRoute>(
      path: 'gd-symbols',
      routes: [TypedGoRoute<GdSymbolDetailsRoute>(path: 'details')],
    ),
  ],
)
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

class CuttingSpeedRoute extends GoRouteData with $CuttingSpeedRoute {
  const CuttingSpeedRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CuttingSpeedPage();
}

class FeedRateRoute extends GoRouteData with $FeedRateRoute {
  const FeedRateRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FeedRatePage();
}

class SpindleSpeedRoute extends GoRouteData with $SpindleSpeedRoute {
  const SpindleSpeedRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SpindleSpeedPage();
}

class TapDrillRoute extends GoRouteData with $TapDrillRoute {
  const TapDrillRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TapDrillPage();
}

class ConverterRoute extends GoRouteData with $ConverterRoute {
  const ConverterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ConverterPage();
}

class TolerancesRoute extends GoRouteData with $TolerancesRoute {
  const TolerancesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TolerancePage();
}

class GCodesRoute extends GoRouteData with $GCodesRoute {
  const GCodesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const GCodesPage();
}

class GdSymbolsRoute extends GoRouteData with $GdSymbolsRoute {
  const GdSymbolsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GdSymbolsPage();
}

class GdSymbolDetailsRoute extends GoRouteData with $GdSymbolDetailsRoute {
  final String? $extra;
  const GdSymbolDetailsRoute({this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final symbol = gdSymbolsList.firstWhereOrNull(
      (s) => s.name == ($extra ?? ''),
    );

    if (symbol == null) {
      return const NotFoundPage(
        message:
            'Nie znaleziono symbolu GD&T',
      );
    }

    // 3. Wszystko OK - renderujemy stronę
    return GdSymbolDetailsPage(symbol: symbol);
  }
}

// --- PROVIDER ---
@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: $appRoutes,
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}
