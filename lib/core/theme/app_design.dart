import 'package:flutter/material.dart';

/// Centralized spacing system for the entire application.
///
/// Provides a consistent set of values for margins, paddings, and gaps.
/// Using these constants instead of hardcoded values ensures a
/// professional, grid-based layout.
abstract class AppSpacings {
  // --- Base Values ---
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;

  // --- Predefined EdgeInsets ---
  static const EdgeInsets edgeInsetsXs = EdgeInsets.all(xs);
  static const EdgeInsets edgeInsetsS = EdgeInsets.all(s);
  static const EdgeInsets edgeInsetsM = EdgeInsets.all(m);
  static const EdgeInsets edgeInsetsL = EdgeInsets.all(l);

  /// Symmetrical padding commonly used in lists and forms.
  static const EdgeInsets hvM = EdgeInsets.symmetric(
    horizontal: m,
    vertical: m,
  );
  static const EdgeInsets hM = EdgeInsets.symmetric(horizontal: m);
  static const EdgeInsets vM = EdgeInsets.symmetric(vertical: m);

  // --- Predefined Gaps (SizedBox) ---
  // Using constant Gaps improves performance and code readability.
  static const gapXs = SizedBox(width: xs, height: xs);
  static const gapS = SizedBox(width: s, height: s);
  static const gapM = SizedBox(width: m, height: m);
  static const gapL = SizedBox(width: l, height: l);
}

/// Centralized border radius configuration.
///
/// Ensures that buttons, cards, and input fields share the same
/// visual roundness for a cohesive brand identity.
abstract class AppRadii {
  static const double s = 4.0;
  static const double m = 8.0;
  static const double l = 16.0;

  static final BorderRadius radiusS = BorderRadius.circular(s);
  static final BorderRadius radiusM = BorderRadius.circular(m);
  static final BorderRadius radiusL = BorderRadius.circular(l);
}

/// Logical container width constraints for responsive layouts.
///
/// Helps to limit the width of content on larger screens (Tablet/Desktop)
/// to maintain readability and optimal line lengths.
enum ContainerSize {
  /// Extra small layouts or tooltips.
  compact(320.0),

  /// Narrow phone-style layouts.
  narrow(420.0),

  /// Standard form container width.
  form(550.0),

  /// Balanced medium container.
  medium(750.0),

  /// Optimal width for text readability.
  reading(900.0),

  /// Wide desktop content.
  wide(1150.0),

  /// Full screen width.
  full(double.infinity);

  final double maxWidth;
  const ContainerSize(this.maxWidth);
}
