import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/domain/gd_symbol_model.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/presentation/widgets/symbol_datum_badge.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/presentation/widgets/symbol_image_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GdSymbolDetailsPage extends StatelessWidget {
  final GdSymbol symbol;
  const GdSymbolDetailsPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text(symbol.name.tr()), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SymbolImageCard(symbol: symbol, height: screenHeight * 0.45),
            AppSpacings.gapL,
            SymbolDatumBadge(symbol: symbol),
            AppSpacings.gapL,
            Text(
              symbol.description.tr(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
