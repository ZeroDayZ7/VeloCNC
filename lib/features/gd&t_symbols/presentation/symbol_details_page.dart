import 'package:cnc_toolbox/features/gd&t_symbols/domain/gd_symbol_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GdSymbolDetailsPage extends StatelessWidget {
  final GdSymbol symbol;
  const GdSymbolDetailsPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(symbol.name.tr())),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
        ), // padding tylko w osi X
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: symbol.assetImage != null
                    ? InteractiveViewer(
                        panEnabled: true,
                        minScale: 0.5,
                        maxScale: 4.0,
                        child: Image.asset(
                          symbol.assetImage!,
                          fit: BoxFit.contain,
                          width:
                              screenWidth -
                              8, // maksymalna szerokość z paddingiem
                        ),
                      )
                    : Text(symbol.symbol, style: const TextStyle(fontSize: 80)),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              symbol.requiresDatum
                  ? "gd_symbols.details.requires_datum".tr()
                  : "gd_symbols.details.no_datum".tr(),
              style: TextStyle(
                color: symbol.requiresDatum ? Colors.orange : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              symbol.description.tr(),
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
