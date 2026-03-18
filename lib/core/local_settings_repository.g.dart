// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_settings_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localSettingsRepository)
final localSettingsRepositoryProvider = LocalSettingsRepositoryProvider._();

final class LocalSettingsRepositoryProvider
    extends
        $FunctionalProvider<
          LocalSettingsRepository,
          LocalSettingsRepository,
          LocalSettingsRepository
        >
    with $Provider<LocalSettingsRepository> {
  LocalSettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localSettingsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localSettingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalSettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalSettingsRepository create(Ref ref) {
    return localSettingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalSettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalSettingsRepository>(value),
    );
  }
}

String _$localSettingsRepositoryHash() =>
    r'b63010f570025b68b68e1da227c2a3fc5efa267c';
