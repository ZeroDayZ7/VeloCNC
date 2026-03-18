// lib/features/converter/models/unit_model.dart
class UnitDefinition {
  final String id;
  final String label;
  final String symbol;
  final double Function(double val) toBase;
  final double Function(double val) fromBase;

  const UnitDefinition({
    required this.id,
    required this.label,
    required this.symbol,
    required this.toBase,
    required this.fromBase,
  });
}