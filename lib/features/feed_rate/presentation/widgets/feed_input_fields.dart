import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedInputFields extends ConsumerWidget {
  final FeedType type;
  final TextEditingController nController;
  final TextEditingController zController;
  final TextEditingController fzController;

  const FeedInputFields({
    super.key,
    required this.type,
    required this.nController,
    required this.zController,
    required this.fzController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(feedRateProvider(type).notifier);

    return Column(
      children: [
        TextField(
          controller: nController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: "Obroty (n)",
            suffixText: "obr/min",
          ),
          onChanged: notifier.updateSpindleSpeed,
        ),
        AppSpacings.gapMs,
        TextField(
          controller: zController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Liczba ostrzy (z)",
            suffixText: "szt.",
          ),
          onChanged: notifier.updateTeeth,
        ),
        AppSpacings.gapMs,
        TextField(
          controller: fzController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
