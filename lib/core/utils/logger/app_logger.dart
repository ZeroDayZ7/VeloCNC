import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Abstract interface for the application's logging system.
///
/// Defines standard logging levels and allows for easy integration
/// of different logging backends or mocks during testing.
abstract class IAppLogger {
  /// Debug: used for information useful to developers during development.
  void d(
    String message, {
    String? module,
    dynamic error,
    StackTrace? stackTrace,
  });

  /// Info: used for highlighting progress of the application at a high level.
  void i(
    String message, {
    String? module,
    dynamic error,
    StackTrace? stackTrace,
  });

  /// Warning: used for potentially harmful situations.
  void w(
    String message, {
    String? module,
    dynamic error,
    StackTrace? stackTrace,
  });

  /// Error: used for error events that might still allow the app to continue running.
  void e(
    String message, {
    String? module,
    dynamic error,
    StackTrace? stackTrace,
  });

  /// Trace: used for very fine-grained information about the application flow.
  void t(
    String message, {
    String? module,
    dynamic error,
    StackTrace? stackTrace,
  });
}

/// Production implementation of [IAppLogger] using the 'logger' package.
///
/// Automatically adjusts log verbosity based on the build mode:
/// - Debug: Full verbose logging for easier troubleshooting.
/// - Release: Only warnings and errors are logged to minimize performance impact.
class AppLogger implements IAppLogger {
  final Logger _logger;

  AppLogger()
    : _logger = Logger(
        // Automatically set logging floor based on build environment
        level: kReleaseMode ? Level.warning : Level.debug,
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 3,
          lineLength: 80,
          colors: true,
          printEmojis: false,
          noBoxingByDefault: true,
        ),
      );

  @override
  void d(
    String message, {
    String? module,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      _logger.d(_format(message, module), error: error, stackTrace: stackTrace);

  @override
  void i(
    String message, {
    String? module,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      _logger.i(_format(message, module), error: error, stackTrace: stackTrace);

  @override
  void w(
    String message, {
    String? module,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      _logger.w(_format(message, module), error: error, stackTrace: stackTrace);

  @override
  void e(
    String message, {
    String? module,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      _logger.e(_format(message, module), error: error, stackTrace: stackTrace);

  @override
  void t(
    String message, {
    String? module,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      _logger.t(_format(message, module), error: error, stackTrace: stackTrace);

  /// Standardizes the log output format, optionally prepending the module name.
  String _format(String message, String? module) =>
      module != null ? '[$module] $message' : message;
}
