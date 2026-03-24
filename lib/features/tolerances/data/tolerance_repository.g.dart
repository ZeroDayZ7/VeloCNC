// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tolerance_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(toleranceRepository)
final toleranceRepositoryProvider = ToleranceRepositoryProvider._();

final class ToleranceRepositoryProvider
    extends
        $FunctionalProvider<
          IToleranceRepository,
          IToleranceRepository,
          IToleranceRepository
        >
    with $Provider<IToleranceRepository> {
  ToleranceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toleranceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toleranceRepositoryHash();

  @$internal
  @override
  $ProviderElement<IToleranceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IToleranceRepository create(Ref ref) {
    return toleranceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IToleranceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IToleranceRepository>(value),
    );
  }
}

String _$toleranceRepositoryHash() =>
    r'c995c8882e1ea0bb60bed83dfba15022de5674b7';
