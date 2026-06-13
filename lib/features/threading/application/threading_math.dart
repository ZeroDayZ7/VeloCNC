import 'dart:math' as math;

class ThreadingMath {
  static int calculateRPM({required double vc, required double diameter}) {
    if (diameter <= 0 || vc <= 0) return 0;
    final rpm = (vc * 1000) / (math.pi * diameter);
    return rpm.round();
  }

  static double calculateFeed({required int rpm, required double pitch}) {
    return rpm * pitch;
  }

  static double holeSizeCutting({
    required double nominalDiameter,
    required double pitch,
  }) {
    return nominalDiameter - pitch;
  }

  static double holeSizeForming({
    required double nominalDiameter,
    required double pitch,
  }) {
    return nominalDiameter - (0.45 * pitch);
  }

  static double calculateSwelling({
    required double nominalDiameter,
    required double swellingRatio,
  }) {
    return nominalDiameter * swellingRatio;
  }
}
