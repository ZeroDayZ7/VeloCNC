// lib/features/feed_rate/domain/feed_rate_math.dart
class FeedRateMath {
  static double calculateVf(double n, double fz, int z) => n * fz * z;

  static double calculateF(double fz, int z) => fz * z;

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

    final result = vf * factor;
    return result < 0 ? 0 : result;
  }
}
