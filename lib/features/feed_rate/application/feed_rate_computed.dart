import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_calculator.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_computed.g.dart';

@Riverpod(keepAlive: true)
double feedRateVf(Ref ref, FeedType type) {
  final s = ref.watch(feedRateProvider(type));

  return FeedRateCalculator.calculateMillingFeed(
    spindleSpeed: s.spindleSpeed,
    feedPerTooth: s.feedPerTooth,
    numberOfTeeth: s.numberOfTeeth,
  );
}

@Riverpod(keepAlive: true)
double adjustedFeedRate(Ref ref, FeedType type) {
  final vf = ref.watch(feedRateVfProvider(type));
  final s = ref.watch(feedRateProvider(type));

  return FeedRateCalculator.calculateAdjustedFeed(
    baseFeed: vf,
    toolDiameter: s.toolDiameter,
    featureDiameter: s.featureDiameter,
    isInternal: s.isInternal,
  );
}
