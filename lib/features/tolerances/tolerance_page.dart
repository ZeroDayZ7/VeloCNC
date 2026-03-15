import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'tolerance_service.dart';

class TolerancePage extends StatefulWidget {
  const TolerancePage({super.key});

  @override
  State<TolerancePage> createState() => _TolerancePageState();
}

class _TolerancePageState extends State<TolerancePage> {
  final TextEditingController _diameterController = TextEditingController();

  ToleranceType _selectedType = ToleranceType.hole;
  String? _selectedLetter;
  String? _selectedNumber;
  ToleranceResult? _result;

  @override
  void initState() {
    super.initState();
    _resetToDefaults();
  }

  void _resetToDefaults() {
    final letters = ToleranceService.getLetters(_selectedType);
    if (letters.isNotEmpty) {
      _selectedLetter = letters.contains('H')
          ? 'H'
          : (letters.contains('h') ? 'h' : letters.first);
      final numbers = ToleranceService.getNumbersForLetter(
        _selectedType,
        _selectedLetter!,
      );
      _selectedNumber = numbers.contains('7') ? '7' : numbers.first;
    }
  }

  void _calculate() {
    final diameter = double.tryParse(_diameterController.text);
    if (diameter == null ||
        _selectedLetter == null ||
        _selectedNumber == null) {
      setState(() => _result = null);
      return;
    }
    setState(() {
      _result = ToleranceService.calculate(
        diameter,
        _selectedLetter!,
        _selectedNumber!,
        _selectedType,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.tools_tolerances.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTypeSelector(),
            const SizedBox(height: 16),
            _buildInputCard(),
            const SizedBox(height: 24),
            if (_result != null) _buildResultSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeSelector() {
    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<ToleranceType>(
        segments: [
          ButtonSegment(
            value: ToleranceType.hole,
            label: const Text("Otwór"),
            icon: const Icon(Icons.circle_outlined),
          ),
          ButtonSegment(
            value: ToleranceType.shaft,
            label: const Text("Wałek"),
            icon: const Icon(Icons.panorama_fish_eye),
          ),
        ],
        selected: {_selectedType},
        onSelectionChanged: (newSelection) {
          setState(() {
            _selectedType = newSelection.first;
            _resetToDefaults();
            _calculate();
          });
        },
      ),
    );
  }

  Widget _buildInputCard() {
    final letters = ToleranceService.getLetters(_selectedType);
    final numbers = _selectedLetter != null
        ? ToleranceService.getNumbersForLetter(_selectedType, _selectedLetter!)
        : <String>[];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _diameterController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: LocaleKeys.tolerance_diameter.tr(),
                suffixText: "mm",
                border: const OutlineInputBorder(),
              ),
              onChanged: (_) => _calculate(),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    key: ValueKey('letter_$_selectedType'),
                    initialValue: _selectedLetter,
                    decoration: const InputDecoration(
                      labelText: "Litera",
                      border: OutlineInputBorder(),
                    ),
                    items: letters
                        .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedLetter = val;
                        _selectedNumber = ToleranceService.getNumbersForLetter(
                          _selectedType,
                          val!,
                        ).first;
                      });
                      _calculate();
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    key: ValueKey('number_${_selectedLetter}_$_selectedType'),
                    initialValue: _selectedNumber,
                    decoration: const InputDecoration(
                      labelText: "Klasa",
                      border: OutlineInputBorder(),
                    ),
                    items: numbers
                        .map((n) => DropdownMenuItem(value: n, child: Text(n)))
                        .toList(),
                    onChanged: (val) {
                      setState(() => _selectedNumber = val);
                      _calculate();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultSection(BuildContext context) {
    final res = _result!;
    return Column(
      children: [
        _buildResultTile(
          "Odchyłka górna",
          "+${res.upperDeviation.toStringAsFixed(3)} mm",
          Colors.green,
        ),
        _buildResultTile(
          "Odchyłka dolna",
          "${res.lowerDeviation.toStringAsFixed(3)} mm",
          Colors.red,
        ),
        const Divider(height: 32),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                "Wymiar rzeczywisty",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              Text(
                "Ø${res.minSize.toStringAsFixed(3)} – Ø${res.maxSize.toStringAsFixed(3)}",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResultTile(String label, String value, Color color) {
    return ListTile(
      title: Text(label),
      trailing: Text(
        value,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
