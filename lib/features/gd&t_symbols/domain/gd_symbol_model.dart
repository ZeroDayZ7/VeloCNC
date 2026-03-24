// lib/features/gd&t_symbols/domain/gd_symbol_model.dart
import 'package:cnc_toolbox/core/constants/generated/assets.gen.dart';

enum SymbolCategory { form, orientation, location, runout }

class GdSymbol {
  final String id;
  final String name;
  final SvgGenImage symbol;
  final String description;
  final SymbolCategory category;
  final bool requiresDatum;
  final AssetGenImage? assetImage;

  const GdSymbol({
    required this.id,
    required this.name,
    required this.symbol,
    required this.description,
    required this.category,
    this.requiresDatum = false,
    this.assetImage,
  });
}
