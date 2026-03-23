import 'package:cnc_toolbox/core/database/daos/drift_feed_rate_dao.dart';
import 'package:cnc_toolbox/core/database/daos/drift_search_dao.dart';
import 'package:cnc_toolbox/core/database/tables/feed_calculations.dart';
import 'package:cnc_toolbox/core/database/tables/search_results.dart';
import 'package:drift/drift.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [SearchResults, FeedCalculations],
  daos: [DriftFeedRateDao, DriftSearchDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 3) {
        await m.createIndex(
          Index(
            'feed_calculations',
            'CREATE INDEX feed_created_at_idx ON feed_calculations (created_at);',
          ),
        );
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
