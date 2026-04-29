import 'package:cnc_toolbox/core/database/daos/drift_feed_rate_dao.dart';
import 'package:cnc_toolbox/core/database/daos/drift_search_dao.dart';
import 'package:cnc_toolbox/core/database/database_migrations.dart'; // Nowy import
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
  MigrationStrategy get migration => DatabaseMigrations(this).strategy;
}
