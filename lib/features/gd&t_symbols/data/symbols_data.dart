import 'package:cnc_toolbox/features/gd&t_symbols/domain/gd_symbol_model.dart';

const gdSymbolsList = [
  // Tolerancje kształtu
  GdSymbol(
    name: "gd_symbols.items.straightness.name",
    symbol: "—",
    description: "gd_symbols.items.straightness.desc",
    category: SymbolCategory.form,
    requiresDatum: false,
  ),
  GdSymbol(
    name: "gd_symbols.items.flatness.name",
    symbol: "▱",
    description: "gd_symbols.items.flatness.desc",
    category: SymbolCategory.form,
    requiresDatum: false,
  ),
  // Tolerancje kierunku
  GdSymbol(
    name: "gd_symbols.items.parallelism.name",
    symbol: "∥",
    description: "gd_symbols.items.parallelism.desc",
    category: SymbolCategory.orientation,
    requiresDatum: true,
  ),
  GdSymbol(
    name: "gd_symbols.items.perpendicularity.name",
    symbol: "⊥",
    description: "gd_symbols.items.perpendicularity.desc",
    category: SymbolCategory.orientation,
    requiresDatum: true,
  ),
];
