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
    extends $NotifierProvider<ToleranceController, TolerancePageState> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TolerancePageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TolerancePageState>(value),
    );
  }
}

String _$toleranceControllerHash() =>
    r'6b77240b20355fa4853c64a7dcb1f47d7fc96dad';

abstract class _$ToleranceController extends $Notifier<TolerancePageState> {
  TolerancePageState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TolerancePageState, TolerancePageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TolerancePageState, TolerancePageState>,
              TolerancePageState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
