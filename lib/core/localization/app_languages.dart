import 'package:flutter/material.dart';

enum AppLanguage {
  polish(Locale('pl'), 'Polski', '🇵🇱'),
  english(Locale('en'), 'English', '🇬🇧'),
  german(Locale('de'), 'Deutsch', '🇩🇪');

  const AppLanguage(this.locale, this.name, this.flag);

  final Locale locale;
  final String name;
  final String flag;

  static List<Locale> get supportedLocales =>
      AppLanguage.values.map((lang) => lang.locale).toList();
}
