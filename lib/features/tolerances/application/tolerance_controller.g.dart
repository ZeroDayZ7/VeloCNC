// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tolerance_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ToleranceController)
final toleranceControllerProvider = ToleranceControllerProvider._();

final class ToleranceControllerProvider
    extends $AsyncNotifierProvider<ToleranceController, TolerancePageState> {
  ToleranceControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toleranceControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toleranceControllerHash();

  @$internal
  @override
  ToleranceController create() => ToleranceController();
}

String _$toleranceControllerHash() =>
    r'e0cd23c63d58a5a732c1a69b36ab2936f1978eae';

abstract class _$ToleranceController
    extends $AsyncNotifier<TolerancePageState> {
  FutureOr<TolerancePageState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<TolerancePageState>, TolerancePageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TolerancePageState>, TolerancePageState>,
              AsyncValue<TolerancePageState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
