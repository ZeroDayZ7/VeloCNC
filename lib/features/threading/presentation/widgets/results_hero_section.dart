import 'package:cnc_toolbox/features/threading/application/threading_computed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultsHeroSection extends ConsumerWidget {
  const ResultsHeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obserwujemy nasze "computed providers"
    final rpm = ref.watch(threadingRpmProvider);
    final holeSize = ref.watch(threadingHoleSizeProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ResultItem(
            label: 'OBROTY',
            value: rpm > 0 ? '${rpm.toInt()}' : '---',
            unit: 'obr/min',
          ),
          _ResultItem(
            label: 'WIERTŁO',
            value: holeSize > 0 ? holeSize.toStringAsFixed(2) : '---',
            unit: 'mm',
          ),
        ],
      ),
    );
  }
}

class _ResultItem extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const _ResultItem({
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          unit,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(
              context,
            ).colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
