import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../tolerance_service.dart';

class ToleranceResultDisplay extends StatelessWidget {
  final ToleranceResult res;

  const ToleranceResultDisplay({super.key, required this.res});

  // Pomocnicza funkcja do formatowania liczb lub zwracania kreski
  String _formatValue(double? value, {bool showPlus = false}) {
    if (value == null) return "-";
    final formatted = value.toStringAsFixed(3);
    // Dodajemy "+" tylko jeśli wartość jest dodatnia i flaga jest aktywna
    if (showPlus && value > 0) return "+$formatted";
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (res.infoKey != null)
          _buildBanner(
            context,
            res.infoKey!.tr(),
            Icons.info_outline,
            Colors.blue,
          ),

        if (res.restrictionKey != null)
          _buildBanner(
            context,
            res.restrictionKey!.tr(),
            Icons.warning_amber_rounded,
            Colors.orange,
          ),

        _buildDeviationTile(
          "Odchyłka górna",
          "${_formatValue(res.upperDeviation, showPlus: true)} mm",
          res.upperDeviation != null ? Colors.green : Colors.grey,
        ),
        _buildDeviationTile(
          "Odchyłka dolna",
          "${_formatValue(res.lowerDeviation)} mm",
          res.lowerDeviation != null ? Colors.red : Colors.grey,
        ),

        const SizedBox(height: 16),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Text(
                "Wymiar rzeczywisty",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Text(
                // Ø- lub Ø10.000 – Ø10.005
                "Ø${_formatValue(res.minSize)} – Ø${_formatValue(res.maxSize)}",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBanner(
    BuildContext context,
    String text,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviationTile(String label, String value, Color color) {
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
