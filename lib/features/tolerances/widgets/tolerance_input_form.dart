import 'package:cnc_toolbox/features/tolerances/tolerance_service.dart';
import 'package:flutter/material.dart';


class ToleranceInputForm extends StatelessWidget {
  final TextEditingController diameterController;
  final ToleranceType selectedType;
  final String? selectedLetter;
  final String? selectedNumber;
  final VoidCallback onChanged;
  final Function(String?) onLetterChanged;
  final Function(String?) onNumberChanged;

  const ToleranceInputForm({
    super.key,
    required this.diameterController,
    required this.selectedType,
    required this.selectedLetter,
    required this.selectedNumber,
    required this.onChanged,
    required this.onLetterChanged,
    required this.onNumberChanged,
  });

  @override
  Widget build(BuildContext context) {
    final letters = ToleranceService.getLetters(selectedType);
    final numbers = selectedLetter != null
        ? ToleranceService.getNumbersForLetter(selectedType, selectedLetter!)
        : <String>[];

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: diameterController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: "Średnica nominalna",
                suffixText: "mm",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.straighten),
              ),
              onChanged: (_) => onChanged(),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedLetter,
                    decoration: const InputDecoration(
                      labelText: "Litera",
                      border: OutlineInputBorder(),
                    ),
                    items: letters
                        .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                        .toList(),
                    onChanged: onLetterChanged,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedNumber,
                    decoration: const InputDecoration(
                      labelText: "Klasa",
                      border: OutlineInputBorder(),
                    ),
                    items: numbers
                        .map((n) => DropdownMenuItem(value: n, child: Text(n)))
                        .toList(),
                    onChanged: onNumberChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
