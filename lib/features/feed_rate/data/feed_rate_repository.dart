import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_calculation_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_repository.g.dart';

abstract class IFeedRateRepository {
  Future<void> saveCalculationDto(FeedCalculationDto dto);
  Future<List<FeedCalculation>> getHistory({int limit = 10, int offset = 0});
  Future<void> deleteEntry(int id);
}

class FeedRateRepository implements IFeedRateRepository {
  final AppDatabase _db;
  FeedRateRepository(this._db);

  @override
  Future<void> saveCalculationDto(FeedCalculationDto dto) async {
    await _db.saveFeedCalculation(
      n: dto.n,
      fz: dto.fz,
      z: dto.z,
      vf: dto.vf,
      d: dto.toolDiameter > 0 ? dto.toolDiameter : null,
      dWork: dto.featureDiameter > 0 ? dto.featureDiameter : null,
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
