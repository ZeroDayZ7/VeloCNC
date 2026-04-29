import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_calculator.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_state.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/data/history_repository_provider.dart';
import 'package:cnc_toolbox/features/history/domain/feed_history_item.dart';
import 'package:cnc_toolbox/features/history/domain/history_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_provider.g.dart';

@Riverpod(keepAlive: true)
class FeedRateNotifier extends _$FeedRateNotifier {
  @override
  FeedRateState build(FeedType type) => const FeedRateState();

  void calculate() {
    final vf = FeedRateCalculator.calculateMillingFeed(
      spindleSpeed: state.spindleSpeed,
      feedPerTooth: state.feedPerTooth,
      numberOfTeeth: state.numberOfTeeth,
    );

    final f = (state.feedPerTooth > 0 && state.numberOfTeeth > 0)
        ? state.feedPerTooth * state.numberOfTeeth
        : 0.0;

    double finalVf = vf;
    if (type == FeedType.arc) {
      finalVf = FeedRateCalculator.calculateAdjustedFeed(
        baseFeed: vf,
        toolDiameter: state.toolDiameter,
        featureDiameter: state.featureDiameter,
        isInternal: state.isInternal,
      );
    }

    state = state.copyWith(resultVf: finalVf, resultF: f);
  }

  Future<void> save() async {
    final log = ref.read(appLoggerProvider);
    final repo = ref.read(historyRepositoryProvider);

    if (state.resultVf <= 0) return;

    final operation = await AsyncValue.guard(() async {
      final res = await repo.saveFeedCalculation(
        n: state.spindleSpeed,
        fz: state.feedPerTooth,
        z: state.numberOfTeeth,
        vf: state.resultVf,
        d: state.toolDiameter > 0 ? state.toolDiameter : null,
        dWork: state.featureDiameter > 0 ? state.featureDiameter : null,
      );

      return switch (res) {
        Success(data: final d) => d,
        Failure(error: final e) => throw Exception(e.toString()),
      };
    });

    operation.whenOrNull(
      data: (_) {
        log.i("Saved calculation to history", module: "FEED_RATE");
        ref.read(historyProvider.notifier).refreshHistory();
      },
      error: (e, _) =>
          log.e("Save to history failed", module: "DATABASE", error: e),
    );
  }

  void loadFromHistory(FeedHistoryItem entry) {
    state = FeedRateState(
      spindleSpeed: entry.n,
      feedPerTooth: entry.fz,
      numberOfTeeth: entry.z,
      toolDiameter: entry.toolDiameter,
      featureDiameter: entry.featureDiameter ?? 0.0,
    );
    calculate();
  }

  void updateSpindleSpeed(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    state = state.copyWith(spindleSpeed: val ?? 0.0);
  }

  void updateFeedPerTooth(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    state = state.copyWith(feedPerTooth: val ?? 0.0);
  }

  void updateTeeth(String rawValue) {
    final val = int.tryParse(rawValue);
    state = state.copyWith(numberOfTeeth: val ?? 0);
  }

  void updateToolDia(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    state = state.copyWith(toolDiameter: val ?? 0.0);
  }

  void updateFeatureDia(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    state = state.copyWith(featureDiameter: val ?? 0.0);
  }

  void toggleWorkType(bool isInternal) {
    state = state.copyWith(isInternal: isInternal);
  }
}
