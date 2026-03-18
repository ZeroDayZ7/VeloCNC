// lib/features/feed_rate/application/feed_rate_provider.dart
import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/utils/logger/app_logger.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/data/feed_rate_repository.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_math.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_provider.g.dart';

@Riverpod(keepAlive: true)
class FeedRateNotifier extends _$FeedRateNotifier {
  @override
  FeedRateState build(String type) => const FeedRateState();

  IAppLogger get _log => ref.read(appLoggerProvider);
  IFeedRateRepository get _repo => ref.read(feedRateRepositoryProvider);

  // --- AKCJE ---

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

  // --- UPDATES ---

  void updateSpindleSpeed(String v) => _update(
    () => state = state.copyWith(spindleSpeed: double.tryParse(v) ?? 0),
  );

  void updateFeedPerTooth(String v) => _update(
    () => state = state.copyWith(feedPerTooth: double.tryParse(v) ?? 0),
  );

  void updateTeeth(int v) =>
      _update(() => state = state.copyWith(numberOfTeeth: v));

  void updateToolDia(String v) => _update(
    () => state = state.copyWith(toolDiameter: double.tryParse(v) ?? 0),
  );

  void updateFeatureDia(String v) => _update(
    () => state = state.copyWith(featureDiameter: double.tryParse(v) ?? 0),
  );

  void toggleWorkType(bool isInternal) =>
      _update(() => state = state.copyWith(isInternal: isInternal));

  // --- LOGIKA ---

  void _update(void Function() action) {
    action();
    _calculate();
  }

  void _calculate() {
    final vf = FeedRateMath.calculateVf(
      state.spindleSpeed,
      state.feedPerTooth,
      state.numberOfTeeth,
    );

    final f = FeedRateMath.calculateF(state.feedPerTooth, state.numberOfTeeth);

    final vfArc = FeedRateMath.calculateArcCompensation(
      vf: vf,
      toolDia: state.toolDiameter,
      featureDia: state.featureDiameter,
      isInternal: state.isInternal,
    );

    state = state.copyWith(resultVf: vf, resultVfArc: vfArc, resultF: f);
  }
}
