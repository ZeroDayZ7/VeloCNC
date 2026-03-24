import 'package:cnc_toolbox/core/constants/generated/assets.gen.dart';

typedef AppAssets = Assets;

/// --- APP INFO ---
abstract class AppInfo {
  static const appName = 'VeloCNC';
  static const appVersion = '1.0.0';
  static const contactEmail = 'support@velocnc.com';
  static const websiteUrl = 'https://velocnc.com';
}

/// --- PREFERENCES KEYS ---
abstract class PreferencesKeys {
  static const isDarkMode = 'is_dark_mode';
  static const sidebarExpanded = 'sidebar_expanded';
  static const unitsKeyPrefix = 'units_';
}

/// --- APP CONFIG ---
abstract class AppConfig {
  static const minSplashDuration = Duration(milliseconds: 1500);
  static const searchDebounce = Duration(milliseconds: 300);
  static const dbName = 'cnc_toolbox_db';
}

/// --- TOLERANCE DEFAULTS ---
abstract class ToleranceDefaults {
  static const String holeLetter = 'H';
  static const String shaftLetter = 'h';
  static const String grade = '7';
}

/// --- LAYOUT & RESPONSIVE ---
abstract class AppBreakpoints {
  static const double desktop = 900.0;
  static const double tablet = 600.0;
  static const double sidebarWidth = 280.0;
}

abstract class AppDurations {
  static const fast = Duration(milliseconds: 150);
  static const normal = Duration(milliseconds: 250);
  static const slow = Duration(milliseconds: 400);
}

abstract class AppOpacity {
  static const subtle = 0.08;
  static const disabled = 0.38;
}
