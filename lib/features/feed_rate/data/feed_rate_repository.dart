// lib/features/feed_rate/data/feed_rate_repository.dart
import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_repository.g.dart';

abstract class IFeedRateRepository {
  Future<void> saveCalculation(FeedRateState state);
  Future<List<FeedCalculation>> getHistory({int limit = 10, int offset = 0});
  Future<void> deleteEntry(int id);
}

class FeedRateRepository implements IFeedRateRepository {
  final AppDatabase _db;
  FeedRateRepository(this._db);

  @override
  Future<void> saveCalculation(FeedRateState state) async {
    await _db.saveFeedCalculation(
      n: state.spindleSpeed,
      fz: state.feedPerTooth,
      z: state.numberOfTeeth,
      vf: state.resultVf,
      d: state.toolDiameter > 0 ? state.toolDiameter : null,
      dWork: state.featureDiameter > 0 ? state.featureDiameter : null,
    );
  }

  @override
  Future<List<FeedCalculation>> getHistory({int limit = 10, int offset = 0}) {
    return _db.getFeedHistory(limit: limit, offset: offset);
  }

  @override
  Future<void> deleteEntry(int id) => _db.deleteFeedEntry(id);
}

@Riverpod(keepAlive: true)
IFeedRateRepository feedRateRepository(Ref ref) {
  return FeedRateRepository(ref.watch(databaseProvider));
}
