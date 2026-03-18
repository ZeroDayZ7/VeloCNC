// lib/features/feed_rate/domain/feed_rate_calculator.dart
class FeedRateCalculator {
  static double calculateVf(double n, double fz, int z) => n * fz * z;

  static double calculateArcCompensation({
    required double vf,
    required double toolDia,
    required double featureDia,
    required bool isInternal,
  }) {
    if (toolDia <= 0 || featureDia <= 0) return vf;
    final factor = isInternal
        ? (featureDia - toolDia) / featureDia
        : (featureDia + toolDia) / featureDia;
    return (vf * factor).clamp(0.0, double.infinity);
  }
}
