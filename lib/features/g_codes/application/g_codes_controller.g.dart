// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_codes_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GCodeController)
final gCodeControllerProvider = GCodeControllerProvider._();

final class GCodeControllerProvider
    extends $AsyncNotifierProvider<GCodeController, GCodeState> {
  GCodeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gCodeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gCodeControllerHash();

  @$internal
  @override
  GCodeController create() => GCodeController();
}

String _$gCodeControllerHash() => r'3f58f61fa057fa12ca763400900dccdbc54ce2d4';

abstract class _$GCodeController extends $AsyncNotifier<GCodeState> {
  FutureOr<GCodeState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<GCodeState>, GCodeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GCodeState>, GCodeState>,
              AsyncValue<GCodeState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredGCodes)
final filteredGCodesProvider = FilteredGCodesProvider._();

final class FilteredGCodesProvider
    extends
        $FunctionalProvider<
          List<GCodeViewModel>,
          List<GCodeViewModel>,
          List<GCodeViewModel>
        >
    with $Provider<List<GCodeViewModel>> {
  FilteredGCodesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredGCodesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredGCodesHash();

  @$internal
  @override
  $ProviderElement<List<GCodeViewModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<GCodeViewModel> create(Ref ref) {
    return filteredGCodes(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GCodeViewModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GCodeViewModel>>(value),
    );
  }
}

String _$filteredGCodesHash() => r'99c88a1eefe398be0276b3eed65e5d92d254c5c4';
