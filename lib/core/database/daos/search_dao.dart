abstract class SearchDao {
  Future<int> saveSearchResult(String query, String json);
}
