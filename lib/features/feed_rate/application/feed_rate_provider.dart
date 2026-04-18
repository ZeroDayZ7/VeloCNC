import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_computed.dart';
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
    final vf = ref.read(feedRateVfProvider(type));
    final avf = ref.read(adjustedFeedRateProvider(type));
    final f = ref.read(feedRateFProvider(type));

    state = state.copyWith(
      resultVf: type == FeedType.arc ? avf : vf,
      resultF: f,
    );
  }

  Future<void> save() async {
    final log = ref.read(appLoggerProvider);
    final repo = ref.read(historyRepositoryProvider);

    if (state.resultVf <= 0) return;

    final result = await repo.saveFeedCalculation(
      n: state.spindleSpeed,
      fz: state.feedPerTooth,
      z: state.numberOfTeeth,
      vf: state.resultVf,
      d: state.toolDiameter > 0 ? state.toolDiameter : null,
      dWork: state.featureDiameter > 0 ? state.featureDiameter : null,
    );

    switch (result) {
      case Success():
        log.i("Saved calculation to history", module: "FEED_RATE");
        ref.read(historyProvider.notifier).refreshHistory();
      case Failure(error: final e):
        log.e("Save to history failed", module: "DATABASE", error: e);
    }
  }

  void loadFromHistory(FeedHistoryItem entry) {
    state = state.copyWith(
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

  void toggleWorkType(bool isInternal) =>
      state = state.copyWith(isInternal: isInternal);
}
