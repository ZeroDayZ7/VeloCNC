// lib/features/converter/models/unit_model.dart

/// A domain model representing a specific unit of measurement.
///
/// It encapsulates the metadata and mathematical transformations required
/// to convert values between this unit and a category-specific base unit.
class UnitDefinition {
  /// Unique identifier for the unit (e.g., 'mm', 'inch'), used for persistence and logic.
  final String id;

  /// The localized display name of the unit (e.g., "Millimeters").
  final String label;

  /// The shorthand representation of the unit (e.g., "mm", "in").
  final String symbol;

  /// Transformation function to convert a value from this unit to the category's base unit.
  ///
  /// Example: (val) => val * 0.001 for converting mm to meters.
  final double Function(double val) toBase;

  /// Transformation function to convert a value from the base unit back to this unit.
  ///
  /// Example: (val) => val / 0.001 for converting meters to mm.
  final double Function(double val) fromBase;

  const UnitDefinition({
    required this.id,
    required this.label,
    required this.symbol,
    required this.toBase,
    required this.fromBase,
  });
}
