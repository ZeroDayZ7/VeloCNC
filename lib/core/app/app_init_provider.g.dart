// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_init_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appInit)
final appInitProvider = AppInitProvider._();

final class AppInitProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AppInitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInitProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInitHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return appInit(ref);
  }
}

String _$appInitHash() => r'85bc6aea7b11d55cca09984e95d9f712f417b329';
