import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GdSymbolsInfoModal extends StatelessWidget {
  const GdSymbolsInfoModal._(); // Prywatny konstruktor

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const _Content(),
    );
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              "Czym jest GD&T?",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "GD&T (Geometric Dimensioning and Tolerancing) to system symboli służący do precyzyjnego definiowania dopuszczalnych odchyłek kształtu, osiowości, bicia i położenia elementów na rysunku technicznym.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "W odróżnieniu od zwykłych tolerancji wymiarowych, GD&T pozwala kontrolować geometrię detalu, co jest kluczowe dla poprawnego montażu i działania maszyn.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: Text(LocaleKeys.common_understand.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
