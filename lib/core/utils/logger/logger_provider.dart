import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:cnc_toolbox/core/utils/logger/app_logger.dart';

part 'logger_provider.g.dart';

/// Provides a global singleton instance of the application logger.
///
/// Returns an [IAppLogger] interface to decouple the logging logic
/// from its specific implementation ([AppLogger]).
/// This approach facilitates easy swapping with a MockLogger during unit tests.
@Riverpod(keepAlive: true)
IAppLogger appLogger(Ref ref) {
  // Returns the default production implementation of the logger.
  return AppLogger();
}
