import 'package:flutter/material.dart';

/// Defines the supported languages within the application.
///
/// Each language includes its corresponding [Locale],
/// display name, and an emoji flag for UI representation.
enum AppLanguage {
  /// Polish language (Primary/Default).
  polish(Locale('pl'), 'Polski', '🇵🇱'),

  /// International English.
  english(Locale('en'), 'English', '🇬🇧'),

  /// German language support.
  german(Locale('de'), 'Deutsch', '🇩🇪');

  const AppLanguage(this.locale, this.name, this.flag);

  /// The technical locale used by the translation engine.
  final Locale locale;

  /// The human-readable name of the language.
  final String name;

  /// Visual representation of the language in the UI.
  final String flag;

  /// Returns a list of all [Locale] objects required for app localization setup.
  static List<Locale> get supportedLocales =>
      AppLanguage.values.map((lang) => lang.locale).toList();
}
