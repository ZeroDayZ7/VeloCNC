import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double vf;
  final double f;
  final bool isArc;

  const ResultCard({
    super.key,
    required this.vf,
    required this.f,
    this.isArc = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isArc
            ? const Color.fromARGB(255, 0, 92, 95)
            : Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            isArc
                ? LocaleKeys.feed_results_compensated_feed.tr()
                : LocaleKeys.feed_results_linear_feed.tr(),
          ),
          Text(
            "${vf.toStringAsFixed(1)} ${LocaleKeys.feed_results_unit_min.tr()}",
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            LocaleKeys.feed_results_per_rev.tr(args: [f.toStringAsFixed(3)]),
          ),
        ],
      ),
    );
  }
}
