import 'package:cnc_toolbox/core/utils/logger/app_logger.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_model.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A global observer for Riverpod providers to monitor state changes and lifecycle events.
///
/// This class logs provider initialization, updates, and disposals to the console
/// to assist in debugging and tracking application state flow.
final class AppObserver extends ProviderObserver {
  final IAppLogger logger;

  const AppObserver(this.logger);

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

    final isLargeState = _isLargeState(newValue);

    if (isLargeState) {
      logger.d(
        '🔄 Provider updated: $name | [Content hidden: State is too large]',
        module: 'Riverpod',
      );
      return;
    }

    logger.d(
      '🔄 Provider updated: $name\n   previous: $previousValue\n   new: $newValue',
      module: 'Riverpod',
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    logger.d(
      '❌ Provider disposed: ${context.provider.name ?? context.provider.runtimeType}',
      module: 'Riverpod',
    );
  }

  bool _isLargeState(Object? value) {
    final largeTypes = [GCodeState, List<GCodeViewModel>];

    Object? target = value;

    if (value is AsyncValue) {
      target = value.hasValue ? value.value : null;
    }

    return largeTypes.any(
      (type) =>
          target.runtimeType == type ||
          target.runtimeType.toString().contains(type.toString()),
    );
  }
}
