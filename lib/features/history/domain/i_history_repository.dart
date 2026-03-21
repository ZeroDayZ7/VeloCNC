// i_history_repository.dart
import 'package:cnc_toolbox/features/history/models/feed_history_entry.dart';

abstract class IHistoryRepository {
  Future<List<FeedHistoryEntry>> getFeedHistory({int limit = 10, int offset = 0});
  
  // Zamiast FeedCalculationsCompanion, przyjmujemy parametry lub DTO
  Future<void> saveCalculation({
    required double n,
    required double fz,
    required int z,
    required double vf,
    double? d,
    double? dWork,
  });

  Future<void> deleteEntry(int id);
}