import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

/// Base class for all domain-specific exceptions.
///
/// Provides a [toLocalizedString] method to ensure technical errors
/// are translated before being displayed to the end-user.
abstract class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, [this.code]);

  @override
  String toString() => message;

  /// Returns a localized error message suitable for display in the UI.
  String toLocalizedString();
}

/// Thrown when the local database fails to initialize or perform health checks.
class DatabaseException extends AppException {
  DatabaseException(super.message, [super.code]);

  @override
  String toLocalizedString() => LocaleKeys.error_database_init.tr();
}

/// Thrown when external assets (e.g., JSON data for G-codes or tolerances)
/// cannot be found or loaded correctly.
class AssetLoadException extends AppException {
  AssetLoadException(super.message);

  @override
  String toLocalizedString() => LocaleKeys.error_assets_missing.tr();
}
