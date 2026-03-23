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
    extends
        $FunctionalProvider<
          AsyncValue<Result<void>>,
          Result<void>,
          FutureOr<Result<void>>
        >
    with $FutureModifier<Result<void>>, $FutureProvider<Result<void>> {
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
  $FutureProviderElement<Result<void>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<void>> create(Ref ref) {
    return appInit(ref);
  }
}

String _$appInitHash() => r'8934c9e54f8a241c999f6c665086bd37b13fdb01';
