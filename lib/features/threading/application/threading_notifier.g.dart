// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threading_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThreadingNotifier)
final threadingProvider = ThreadingNotifierProvider._();

final class ThreadingNotifierProvider
    extends $NotifierProvider<ThreadingNotifier, ThreadingState> {
  ThreadingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'threadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$threadingNotifierHash();

  @$internal
  @override
  ThreadingNotifier create() => ThreadingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThreadingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThreadingState>(value),
    );
  }
}

String _$threadingNotifierHash() => r'4926f5a028fd95f85fb510891e21333426c479f3';

abstract class _$ThreadingNotifier extends $Notifier<ThreadingState> {
  ThreadingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThreadingState, ThreadingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThreadingState, ThreadingState>,
              ThreadingState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
