// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConverterNotifier)
final converterProvider = ConverterNotifierFamily._();

final class ConverterNotifierProvider
    extends $NotifierProvider<ConverterNotifier, ConverterState> {
  ConverterNotifierProvider._({
    required ConverterNotifierFamily super.from,
    required ConverterCategory super.argument,
  }) : super(
         retry: null,
         name: r'converterProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$converterNotifierHash();

  @override
  String toString() {
    return r'converterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ConverterNotifier create() => ConverterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConverterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConverterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ConverterNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$converterNotifierHash() => r'0284740157a36000b319267c4eb03eea5fe5db1a';

final class ConverterNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ConverterNotifier,
          ConverterState,
          ConverterState,
          ConverterState,
          ConverterCategory
        > {
  ConverterNotifierFamily._()
    : super(
        retry: null,
        name: r'converterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ConverterNotifierProvider call(ConverterCategory category) =>
      ConverterNotifierProvider._(argument: category, from: this);

  @override
  String toString() => r'converterProvider';
}

abstract class _$ConverterNotifier extends $Notifier<ConverterState> {
  late final _$args = ref.$arg as ConverterCategory;
  ConverterCategory get category => _$args;

  ConverterState build(ConverterCategory category);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ConverterState, ConverterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ConverterState, ConverterState>,
              ConverterState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
