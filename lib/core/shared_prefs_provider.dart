import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provides a global instance of [SharedPreferences] for local data persistence.
///
/// This provider is intentionally left unimplemented with an [UnimplementedError].
/// It MUST be overridden in the [ProviderScope] or [ProviderContainer] during
/// the application bootstrap process (typically in main.dart or bootstrap.dart)
/// after the async initialization of SharedPreferences is complete.
final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
    'sharedPrefsProvider must be overridden during app initialization.',
  );
});
