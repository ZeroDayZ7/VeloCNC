// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threading_computed.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(threadingRpm)
final threadingRpmProvider = ThreadingRpmProvider._();

final class ThreadingRpmProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  ThreadingRpmProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'threadingRpmProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$threadingRpmHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return threadingRpm(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$threadingRpmHash() => r'7f4e1be8409535416d42a645df5c6735e359c8de';

@ProviderFor(threadingHoleSize)
final threadingHoleSizeProvider = ThreadingHoleSizeProvider._();

final class ThreadingHoleSizeProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  ThreadingHoleSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'threadingHoleSizeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$threadingHoleSizeHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return threadingHoleSize(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$threadingHoleSizeHash() => r'0787dfc01f92027e7674748a103391bf50505201';
