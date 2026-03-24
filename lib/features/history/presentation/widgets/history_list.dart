import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/domain/feed_history_item.dart';
import 'package:cnc_toolbox/features/history/domain/history_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryList extends ConsumerWidget {
  final List<FeedHistoryItem> history;
  final FeedType targetType;
  final ScrollController scrollController;

  const HistoryList({
    super.key,
    required this.history,
    required this.targetType,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      controller: scrollController,
      itemCount: history.length,
      itemBuilder: (context, index) {
        final item = history[index];
        return Dismissible(
          key: ValueKey(item.id),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: AppSpacings.edgeInsetsL,
            color: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (_) {
            ref.read(historyProvider.notifier).deleteItem(item.id);
          },
          child: ListTile(
            leading: const Icon(Icons.history),
            title: Text("${item.vf.toStringAsFixed(1)} mm/min"),
            subtitle: Text(
              "n: ${item.n.toInt()}, fz: ${item.fz}, z: ${item.z}",
            ),
            trailing: Text(
              DateFormat('HH:mm').format(item.createdAt),
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
            onTap: () {
              ref
                  .read(feedRateProvider(targetType).notifier)
                  .loadFromHistory(item);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
