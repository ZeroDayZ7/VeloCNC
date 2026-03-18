import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/widgets/info_components.dart';
import 'package:easy_localization/easy_localization.dart';
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
              const InfoSection(
                title: "Jak to działa?",
                content:
                    "Każda linia kodu (tzw. blok) instruuje maszynę, co ma zrobić. Litera 'G' zazwyczaj odnosi się do przygotowania geometrii ruchu (G-eometry), czyli mówi maszynie, czy ma jechać po linii prostej, łuku, czy może wykonać cykl wiercenia.",
              ),
              const SizedBox(height: 20),
              const InfoSection(
                title: "Struktura komendy",
                content:
                    "Typowy blok kodu składa się z litery i wartości liczbowej:\n"
                    "• G01 – Co robić (Ruch liniowy)\n"
                    "• X10 Y20 – Gdzie (Współrzędne)\n"
                    "• F150 – Jak szybko (Posuw/Feedrate)",
              ),
              const SizedBox(height: 20),
              const InfoSection(
                title: "Kody Modalne",
                content:
                    "Większość G-kodów jest 'modalna'. Oznacza to, że raz wydana komenda (np. G21 dla milimetrów) pozostaje aktywna aż do momentu, gdy zostanie zmieniona na inną z tej samej grupy (np. G20 dla cali).",
              ),
              const SizedBox(height: 20),
              const InfoTipCard(
                text:
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
                  child: Text(LocaleKeys.common_understand.tr()),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
