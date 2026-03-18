// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_codes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GCodeSearch)
final gCodeSearchProvider = GCodeSearchProvider._();

final class GCodeSearchProvider extends $NotifierProvider<GCodeSearch, String> {
  GCodeSearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gCodeSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gCodeSearchHash();

  @$internal
  @override
  GCodeSearch create() => GCodeSearch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$gCodeSearchHash() => r'9b689d364ed61b02fc2764e08bed62216a81c8eb';

abstract class _$GCodeSearch extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredGCodes)
final filteredGCodesProvider = FilteredGCodesProvider._();

final class FilteredGCodesProvider
    extends $FunctionalProvider<List<GCode>, List<GCode>, List<GCode>>
    with $Provider<List<GCode>> {
  FilteredGCodesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredGCodesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredGCodesHash();

  @$internal
  @override
  $ProviderElement<List<GCode>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<GCode> create(Ref ref) {
    return filteredGCodes(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GCode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GCode>>(value),
    );
  }
}

String _$filteredGCodesHash() => r'8f8b2128726f30768bae4226a0231ecca3afabb2';
