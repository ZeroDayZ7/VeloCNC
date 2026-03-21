import 'package:cnc_toolbox/core/localization/app_languages.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_notifier.g.dart';

/// A notifier that manages the application's current [Locale] state.
///
/// This provider is kept alive throughout the app's lifecycle to ensure
/// language preferences are preserved during navigation and background tasks.
@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  @override
  /// Sets the default initial language to [AppLanguage.polish].
  Locale build() {
    return AppLanguage.polish.locale;
  }

  /// Updates the application language to the selected [language].
  ///
  /// Includes a guard clause to prevent redundant state updates
  /// if the selected language is already active.
  void setLocale(AppLanguage language) {
    if (state == language.locale) return;
    state = language.locale;
  }
}
