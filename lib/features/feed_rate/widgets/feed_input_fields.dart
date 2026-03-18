import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:flutter/material.dart';

class FeedInputFields extends StatelessWidget {
  final FeedRateNotifier notifier;
  final TextEditingController nController;
  final TextEditingController zController;
  final TextEditingController fzController;

  const FeedInputFields({
    super.key,
    required this.notifier,
    required this.nController,
    required this.zController,
    required this.fzController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Obroty (n)",
            suffixText: "obr/min",
          ),
          onChanged: notifier.updateSpindleSpeed,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: zController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Liczba ostrzy (z)",
            suffixText: "szt.",
          ),
          onChanged: (v) => notifier.updateTeeth(int.tryParse(v) ?? 1),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: fzController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Posuw na ostrze (fz)",
            suffixText: "mm",
          ),
          onChanged: notifier.updateFeedPerTooth,
        ),
      ],
    );
  }
}
