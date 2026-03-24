import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'translator.g.dart';

/// Interfejs - to widzi Twoja logika biznesowa
abstract class Translator {
  String tr(String key, {List<String>? args, Map<String, String>? namedArgs});
}

/// Implementacja - tu "siedzi" easy_localization
class EasyLocalizationTranslator implements Translator {
  @override
  String tr(String key, {List<String>? args, Map<String, String>? namedArgs}) {
    return key.tr(args: args, namedArgs: namedArgs);
  }
}

/// Provider - wystawia Translatora całej aplikacji
@riverpod
Translator translator(Ref ref) {
  return EasyLocalizationTranslator();
}
