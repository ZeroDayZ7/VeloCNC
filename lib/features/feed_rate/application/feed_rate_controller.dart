import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_computed.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/data/history_repository_provider.dart';
import 'package:cnc_toolbox/features/history/domain/history_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_controller.g.dart';

@Riverpod(keepAlive: true)
class FeedRateController extends _$FeedRateController {
  @override
  void build() {}

  Future<void> save(FeedType type) async {
    final log = ref.read(appLoggerProvider);
    final repo = ref.read(historyRepositoryProvider);

    final s = ref.read(feedRateProvider(type));
    final vf = ref.read(feedRateVfProvider(type));
    final avf = ref.read(adjustedFeedRateProvider(type));

    if (vf <= 0) return;
    final finalVf = type == FeedType.arc ? avf : vf;

    final result = await repo.saveFeedCalculation(
      n: s.spindleSpeed,
      fz: s.feedPerTooth,
      z: s.numberOfTeeth,
      vf: finalVf,
      d: s.toolDiameter > 0 ? s.toolDiameter : null,
      dWork: s.featureDiameter > 0 ? s.featureDiameter : null,
    );

    // Obsługa wyniku
    switch (result) {
      case Success():
        log.i("Saved calculation to history", module: "FEED_RATE");
        ref.read(historyProvider.notifier).refreshHistory();

      case Failure(error: final e):
        log.e("Save to history failed", module: "DATABASE", error: e);
    }
  }
}
