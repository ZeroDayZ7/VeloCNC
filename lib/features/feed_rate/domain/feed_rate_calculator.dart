// features/feed_rate/domain/feed_rate_calculator.dart
class FeedRateCalculator {
  static double calculateMillingFeed({
    required double spindleSpeed,
    required double feedPerTooth,
    required int numberOfTeeth,
  }) {
    if (spindleSpeed <= 0 || feedPerTooth <= 0 || numberOfTeeth <= 0) return 0;
    return spindleSpeed * feedPerTooth * numberOfTeeth;
  }

  static double calculateAdjustedFeed({
    required double baseFeed,
    required double toolDiameter,
    required double featureDiameter,
    required bool isInternal,
  }) {
    if (toolDiameter <= 0 || featureDiameter <= 0) return baseFeed;

    final factor = isInternal
        ? (featureDiameter - toolDiameter) / featureDiameter
        : (featureDiameter + toolDiameter) / featureDiameter;

    return baseFeed * factor;
  }
}
