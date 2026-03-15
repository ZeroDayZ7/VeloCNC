// lib/features/gd&t_symbols/domain/gd_symbol_model.dart
enum SymbolCategory { form, orientation, location, runout }

class GdSymbol {
  final String name;
  final String symbol;
  final String description;
  final SymbolCategory category;
  final bool requiresDatum;

  const GdSymbol({
    required this.name,
    required this.symbol,
    required this.description,
    required this.category,
    this.requiresDatum = false,
  });
}
