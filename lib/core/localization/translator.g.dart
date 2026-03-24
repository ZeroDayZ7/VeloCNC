// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider - wystawia Translatora całej aplikacji

@ProviderFor(translator)
final translatorProvider = TranslatorProvider._();

/// Provider - wystawia Translatora całej aplikacji

final class TranslatorProvider
    extends $FunctionalProvider<Translator, Translator, Translator>
    with $Provider<Translator> {
  /// Provider - wystawia Translatora całej aplikacji
  TranslatorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'translatorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$translatorHash();

  @$internal
  @override
  $ProviderElement<Translator> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Translator create(Ref ref) {
    return translator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Translator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Translator>(value),
    );
  }
}

String _$translatorHash() => r'da3de5dedc9ebbbf5e74a8aef84d0c8f2191ad1a';
