import 'dart:async';

import 'package:cnc_toolbox/core/database/database_provider.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/features/history/domain/feed_history_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_notifier.g.dart';

@Riverpod(keepAlive: true)
class HistoryNotifier extends _$HistoryNotifier {
  @override
  FutureOr<List<FeedHistoryItem>> build() async {
    final result = await _fetchAndMapHistory();

    return switch (result) {
      Success<List<FeedHistoryItem>>(data: final list) => list,
      Failure<List<FeedHistoryItem>>(error: final e, stackTrace: final st) =>
        Error.throwWithStackTrace(e, st ?? StackTrace.current),
    };
  }

  Future<Result<List<FeedHistoryItem>>> _fetchAndMapHistory() async {
    try {
      final db = ref.read(databaseProvider);
      final driftData = await db.driftFeedRateDao.getAllHistory();

      final mappedList = driftData
          .map(
            (e) => FeedHistoryItem(
              vf: e.resultVf,
              n: e.spindleSpeed,
              fz: e.feedPerTooth,
              z: e.teeth,
              createdAt: e.createdAt,
              toolDiameter: e.toolDiameter ?? 0.0,
            ),
          )
          .toList();

      return Success(mappedList);
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  Future<void> refreshHistory() async {
    state = const AsyncLoading();
    final result = await _fetchAndMapHistory();

    state = switch (result) {
      Success<List<FeedHistoryItem>>(data: final list) => AsyncData(list),
      Failure<List<FeedHistoryItem>>(error: final e, stackTrace: final st) =>
        AsyncError(e, st ?? StackTrace.current),
    };
  }
}
