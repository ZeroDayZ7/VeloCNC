import 'package:cnc_toolbox/core/database/daos/search_dao.dart'; // Upewnij się, że ścieżka jest OK
import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/database/tables/search_results.dart';
import 'package:drift/drift.dart';

part 'drift_search_dao.g.dart';

@DriftAccessor(tables: [SearchResults])
class DriftSearchDao extends DatabaseAccessor<AppDatabase>
    with _$DriftSearchDaoMixin
    implements SearchDao {
  DriftSearchDao(super.db);

  @override
  Future<int> saveSearchResult(String query, String json) {
    return into(
      searchResults,
    ).insert(SearchResultsCompanion.insert(query: query, resultJson: json));
  }
}
