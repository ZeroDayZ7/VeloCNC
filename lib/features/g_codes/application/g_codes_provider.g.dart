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
        isAutoDispose: false,
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

String _$gCodeSearchHash() => r'3f8c0facf02a84f0bc1372fbd8872361e05741df';

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
        isAutoDispose: false,
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

String _$filteredGCodesHash() => r'b4c7190f526842f57a57fcafe65576481c0ffa3a';
