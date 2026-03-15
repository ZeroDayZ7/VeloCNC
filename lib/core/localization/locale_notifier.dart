import 'package:cnc_toolbox/core/localization/app_languages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_notifier.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() {
    return AppLanguage.polish.locale;
  }

  Future<void> changeLanguage(
    BuildContext context,
    AppLanguage language,
  ) async {
    if (state == language.locale) return;

    state = language.locale;
    await context.setLocale(language.locale);
  }
}
