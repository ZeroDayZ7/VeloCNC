import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A global observer for Riverpod providers to monitor state changes and lifecycle events.
///
/// This class logs provider initialization, updates, and disposals to the console
/// to assist in debugging and tracking application state flow.
final class AppObserver extends ProviderObserver {
  const AppObserver();

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    debugPrint(
      '🟢 Provider added: ${context.provider.name ?? context.provider.runtimeType}',
    );
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    final name =
        context.provider.name ?? context.provider.runtimeType.toString();
    debugPrint('🔄 Provider updated: $name');

    // Filter out large state objects to keep the console readable
    if (newValue.toString().contains('GCodeState')) {
      debugPrint('   [Content hidden: GCodeState is too large]');
      return;
    }

    debugPrint('   previous: $previousValue');
    debugPrint('   new: $newValue');
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    debugPrint(
      '❌ Provider disposed: ${context.provider.name ?? context.provider.runtimeType}',
    );
  }
}
