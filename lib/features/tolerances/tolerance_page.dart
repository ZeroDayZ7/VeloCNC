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
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: "Informacje o tolerancjach",
            onPressed: () => _showInfoModal(context),
          ),
        ],
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

  void _showInfoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
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
                "Tolerancje i Pasowania",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "System pasowań ISO określa dopuszczalne odchyłki wymiarów. Litery określają położenie pola tolerancji względem linii zerowej.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildInfoSection(
                context,
                "Co oznaczają litery?",
                _selectedType == ToleranceType.shaft
                    ? "• a – g: Pasowania luźne (wałek zawsze mniejszy)\n• h: Odchyłka górna = 0 (standard)\n• j – n: Pasowania mieszane\n• p – zc: Pasowania ciasne (wcisk)"
                    : "• A – G: Pasowania luźne (otwór zawsze większy)\n• H: Odchyłka dolna = 0 (najczęstszy standard)\n• J – N: Pasowania mieszane\n• P – ZC: Pasowania ciasne (wcisk)",
              ),
              const SizedBox(height: 20),
              _buildInfoSection(
                context,
                "Klasa dokładności (Liczba)",
                "Im mniejsza liczba, tym węższe pole tolerancji:\n• 5-6: Wysoka precyzja (szlifowanie)\n• 7-9: Dokładność warsztatowa (toczenie/frezowanie)\n• 10+: Wykonania zgrubne",
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Rozumiem"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 8),
        Text(content, style: const TextStyle(fontSize: 15, height: 1.4)),
      ],
    );
  }
}
