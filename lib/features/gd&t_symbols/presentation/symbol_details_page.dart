import 'package:cnc_toolbox/features/gd&t_symbols/domain/gd_symbol_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GdSymbolDetailsPage extends StatelessWidget {
  final GdSymbol symbol;
  const GdSymbolDetailsPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(symbol.name.tr())),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  symbol.symbol,
                  style: const TextStyle(fontSize: 80),
                ),
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
