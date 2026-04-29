import 'package:cnc_toolbox/core/database/database.dart';
import 'package:drift/drift.dart';

class DatabaseMigrations {
  final AppDatabase db;

  DatabaseMigrations(this.db);

  MigrationStrategy get strategy => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 3) {
        await _upgradeToVersion3(m);
      }
    },
    beforeOpen: (details) async {
      await db.customStatement('PRAGMA foreign_keys = ON');
    },
  );

  Future<void> _upgradeToVersion3(Migrator m) async {
    await m.createIndex(
      Index(
        'feed_calculations',
        'CREATE INDEX feed_created_at_idx ON feed_calculations (created_at);',
      ),
    );
  }
}
