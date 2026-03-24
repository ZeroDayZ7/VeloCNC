import 'package:cnc_toolbox/core/database/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_history_item.freezed.dart';

@freezed
sealed class FeedHistoryItem with _$FeedHistoryItem {
  const factory FeedHistoryItem({
    required int id,
    required double vf,
    required double n,
    required double fz,
    required int z,
    required double toolDiameter,
    double? featureDiameter,
    required DateTime createdAt,
  }) = _FeedHistoryItem;
}

extension FeedCalculationX on FeedCalculation {
  FeedHistoryItem toDomain() {
    return FeedHistoryItem(
      id: id,
      vf: resultVf,
      n: spindleSpeed,
      fz: feedPerTooth,
      z: teeth,
      toolDiameter: toolDiameter ?? 0.0,
      featureDiameter: featureDiameter,
      createdAt: createdAt,
    );
  }
}
