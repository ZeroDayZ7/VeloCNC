import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:flutter/material.dart';

/// Extension on [BuildContext] to simplify responsive design checks and layout decisions.
///
/// Centralizes screen size logic using predefined [AppBreakpoints]
/// to ensure UI consistency across the application.
extension ResponsiveHelper on BuildContext {
  /// Returns `true` if the screen width exceeds the Desktop breakpoint.
  bool get isDesktop => MediaQuery.of(this).size.width > AppBreakpoints.desktop;

  /// Returns `true` if the screen width is between Tablet and Desktop breakpoints.
  bool get isTablet =>
      MediaQuery.of(this).size.width >= AppBreakpoints.tablet &&
      MediaQuery.of(this).size.width <= AppBreakpoints.desktop;

  /// Returns `true` for small screens below the Tablet breakpoint.
  bool get isMobile => MediaQuery.of(this).size.width < AppBreakpoints.tablet;

  /// Shorthand access to the current screen width.
  double get screenWidth => MediaQuery.of(this).size.width;
}
