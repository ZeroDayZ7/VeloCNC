import 'package:cnc_toolbox/core/models/result.dart';

/// Contract for database management and lifecycle operations.
///
/// This interface allows the application to remain agnostic of the specific
/// database engine (e.g., Drift, Hive, or Firebase).
abstract class IDatabaseRepository {
  /// Verifies the database connection and operational health.
  ///
  /// Returns a [Result] with `true` if the database is ready for queries,
  /// or a [Failure] containing the underlying error.
  Future<Result<bool>> healthCheck();

  /// Closes the database connection and releases associated resources.
  Future<void> close();
}
