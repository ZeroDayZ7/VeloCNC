import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/database/database_provider.dart';
import 'package:cnc_toolbox/core/database/i_database_repository.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drift_database_repository.g.dart';

/// Concrete implementation of [IDatabaseRepository] using the Drift (SQLite) engine.
///
/// This repository abstracts database operations and provides a high-level
/// API for checking connectivity and managing the database lifecycle.
class DriftDatabaseRepository implements IDatabaseRepository {
  final AppDatabase _db;

  DriftDatabaseRepository(this._db);

  @override
  /// Executes a simple 'SELECT 1' query to verify that the database
  /// is responsive and correctly initialized.
  ///
  /// Returns a [Success] with true if reachable, or [Failure] with the exception details.
  Future<Result<bool>> healthCheck() async {
    try {
      final result = await _db.customSelect('SELECT 1').getSingle();
      return Success(result.data.isNotEmpty);
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  @override
  /// Gracefully closes the underlying database connection.
  Future<void> close() => _db.close();
}

/// Provides the singleton instance of the [IDatabaseRepository].
///
/// By watching [databaseProvider], it ensures the repository is always
/// linked to an active database session.
@Riverpod(keepAlive: true)
IDatabaseRepository databaseRepository(Ref ref) {
  final db = ref.watch(databaseProvider);
  return DriftDatabaseRepository(db);
}
