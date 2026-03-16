import 'package:flutter/material.dart';

class GCodesInfoModal {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              Text(
                "O G-kodach",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "G-kody to znormalizowany język programowania używany do sterowania maszynami CNC (frezarkami, tokarkami, drukarkami 3D).",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),

              const SizedBox(height: 24),

              _section(
                context,
                "Jak to działa?",
                "Każda linia kodu (tzw. blok) instruuje maszynę, co ma zrobić. Litera 'G' zazwyczaj odnosi się do przygotowania geometrii ruchu (G-eometry), czyli mówi maszynie, czy ma jechać po linii prostej, łuku, czy może wykonać cykl wiercenia.",
              ),

              const SizedBox(height: 20),

              _section(
                context,
                "Struktura komendy",
                "Typowy blok kodu składa się z litery i wartości liczbowej:\n"
                    "• G01 – Co robić (Ruch liniowy)\n"
                    "• X10 Y20 – Gdzie (Współrzędne)\n"
                    "• F150 – Jak szybko (Posuw/Feedrate)",
              ),

              const SizedBox(height: 20),

              _section(
                context,
                "Kody Modalne",
                "Większość G-kodów jest 'modalna'. Oznacza to, że raz wydana komenda (np. G21 dla milimetrów) pozostaje aktywna aż do momentu, gdy zostanie zmieniona na inną z tej samej grupy (np. G20 dla cali).",
              ),

              const SizedBox(height: 20),

              _infoCard(
                context,
                "Pamiętaj: Zawsze sprawdzaj 'bezpieczną linię' na początku programu, aby upewnić się, że maszyna jest w odpowiednim trybie (jednostki, płaszczyzna, pozycjonowanie).",
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () => Navigator.pop(context),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Rozumiem"),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _section(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  static Widget _infoCard(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.secondaryContainer.withValues(alpha:0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
