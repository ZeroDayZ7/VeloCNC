import 'package:cnc_toolbox/core/app/app_init_status.dart';
import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/localization/locale_notifier.dart';
import 'package:cnc_toolbox/core/theme/theme_provider.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_init_provider.g.dart';

@riverpod
class AppInitNotifier extends _$AppInitNotifier {
  @override
  AppInitStatus build() =>
      const AppInitStatus.loading(messageKey: LocaleKeys.splash_initializing);

  Future<void> initialize() async => await _runBootstrap();

  Future<void> _runBootstrap() async {
    final logger = ref.read(appLoggerProvider);
    final startTime = DateTime.now();

    try {
      // 1. Ładowanie Bazy
      state = const AppInitStatus.loading(
        messageKey: LocaleKeys.splash_database_init,
      );
      final db = ref.read(databaseProvider);
      await db.customSelect('SELECT 1').getSingle();

      // 2. Ładowanie Ustawień
      state = const AppInitStatus.loading(
        messageKey: LocaleKeys.splash_settings_load,
      );
      ref.read(themeProvider);
      ref.read(localeProvider);

      // 3. Minimum Splash Time
      final elapsed = DateTime.now().difference(startTime);
      const minSplashTime = Duration(milliseconds: 1500);
      if (elapsed < minSplashTime) {
        await Future.delayed(minSplashTime - elapsed);
      }

      state = const AppInitStatus.ready();
    } catch (e, st) {
      logger.e('💥 Bootstrap failed', error: e, stackTrace: st);
      state = AppInitStatus.blocked(reason: e.toString());
    }
  }

  Future<void> recheck() async {
    state = const AppInitStatus.loading(messageKey: 'splash.initializing');
    await _runBootstrap();
  }
}
