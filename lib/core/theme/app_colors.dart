import 'package:flutter/material.dart';

/// Centralized color palette for the application.
///
/// Defines a consistent color language for branding, backgrounds,
/// and domain-specific status indicators used in CNC operations.
abstract class AppColors {
  // --- Brand Colors ---
  /// Deep navy used as the primary brand identity color.
  static const Color primary = Color(0xFF0D47A1);

  /// Lighter blue for secondary elements and highlights.
  static const Color secondary = Color(0xFF1976D2);

  /// Light blue accent for subtle UI details.
  static const Color accent = Color(0xFF64B5F6);

  // --- Backgrounds & Surfaces ---
  /// Primary background color for Dark Mode.
  static const Color bgDark = Color(0xFF121212);

  /// Neutral light grey background for Light Mode.
  static const Color bgLight = Color(0xFFF5F5F5);

  /// Elevated surface color for cards and menus in Dark Mode.
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // --- CNC Domain Specific Statuses ---
  // These colors provide instant visual feedback on machine and tool states.

  /// Indicates the machine is ready for operation or a task is completed.
  static const Color statusReady = Color(0xFF4CAF50);

  /// Represents an active process or movement.
  static const Color statusWorking = Color(0xFF2196F3);

  /// Alerts the user to potential issues or non-critical maintenance.
  static const Color statusWarning = Color(0xFFFFA000);

  /// Critical alarm state requiring immediate operator attention.
  static const Color statusError = Color(0xFFD32F2F);
}
