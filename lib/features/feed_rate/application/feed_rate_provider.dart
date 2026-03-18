import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/core/utils/logger/app_logger.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/data/feed_rate_repository.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_math.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_state.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_provider.g.dart';

@Riverpod(keepAlive: true)
class FeedRateNotifier extends _$FeedRateNotifier {
  @override
  FeedRateState build(FeedType type) => const FeedRateState();

  IAppLogger get _log => ref.read(appLoggerProvider);
  IFeedRateRepository get _repo => ref.read(feedRateRepositoryProvider);

  Future<void> saveCurrentToDb() async {
    if (state.resultVf <= 0) {
      _log.w("Anulowano zapis: wynik Vf jest zerowy", module: "FEED_RATE");
      return;
    }

    try {
      await _repo.saveCalculation(state);
      _log.i("Pomyślnie zapisano obliczenia do bazy", module: "FEED_RATE");
    } catch (e, st) {
      _log.e(
        "Błąd podczas zapisu do bazy",
        module: "DATABASE",
        error: e,
        stackTrace: st,
      );
    }
  }

  void loadFromHistory(FeedCalculation entry) {
    _log.d("Wczytywanie historii ID: ${entry.id}", module: "FEED_RATE");
    state = state.copyWith(
      spindleSpeed: entry.spindleSpeed,
      feedPerTooth: entry.feedPerTooth,
      numberOfTeeth: entry.teeth,
      toolDiameter: entry.toolDiameter ?? 0,
      featureDiameter: entry.featureDiameter ?? 0,
    );
    _calculate();
  }

  void _updateDouble(String v, FeedRateState Function(double val) copyWith) {
    final val = AppNumberFormatter.tryParse(v) ?? 0;
    state = copyWith(val);
    _calculate();
  }

  void updateSpindleSpeed(String v) =>
      _updateDouble(v, (val) => state.copyWith(spindleSpeed: val));

  void updateFeedPerTooth(String v) =>
      _updateDouble(v, (val) => state.copyWith(feedPerTooth: val));

  void updateToolDia(String v) =>
      _updateDouble(v, (val) => state.copyWith(toolDiameter: val));

  void updateFeatureDia(String v) =>
      _updateDouble(v, (val) => state.copyWith(featureDiameter: val));

  void updateTeeth(int v) {
    state = state.copyWith(numberOfTeeth: v);
    _calculate();
  }

  void toggleWorkType(bool isInternal) {
    state = state.copyWith(isInternal: isInternal);
    _calculate();
  }

  void _calculate() {
    final vf = FeedRateMath.calculateVf(
      state.spindleSpeed,
      state.feedPerTooth,
      state.numberOfTeeth,
    );

    final f = FeedRateMath.calculateF(state.feedPerTooth, state.numberOfTeeth);

    double vfArc = 0;
    if (type == FeedType.arc) {
      vfArc = FeedRateMath.calculateArcCompensation(
        vf: vf,
        toolDia: state.toolDiameter,
        featureDia: state.featureDiameter,
        isInternal: state.isInternal,
      );
    }

    state = state.copyWith(resultVf: vf, resultVfArc: vfArc, resultF: f);
  }
}
