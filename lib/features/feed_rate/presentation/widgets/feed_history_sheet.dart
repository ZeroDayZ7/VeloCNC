import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/domain/history_notifier.dart';
import 'package:cnc_toolbox/widgets/empty_state_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedHistorySheet extends ConsumerWidget {
  final FeedType targetType;

  const FeedHistorySheet({super.key, required this.targetType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ZMIANA: Poprawna nazwa providera wygenerowana przez Riverpod
    final historyState = ref.watch(historyProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return historyState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => EmptyStateWidget(
            icon: Icons.error_outline_rounded,
            message: LocaleKeys.splash_error_title.tr(),
            subtitle: err.toString(),
          ),
          data: (history) => Column(
            children: [
              Padding(
                padding: AppSpacings.edgeInsetsM,
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                LocaleKeys.common_history.tr(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacings.gapM,
              Expanded(
                child: history.isEmpty
                    ? Center(child: Text(LocaleKeys.common_no_data.tr()))
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          final item = history[index];

                          // DODANO: Dismissible do usuwania
                          return Dismissible(
                            key: ValueKey(item.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: AppSpacings.edgeInsetsL,
                              color: Colors.red,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            onDismissed: (_) {
                              // Wywołujemy usuwanie z Notifiera
                              ref
                                  .read(historyProvider.notifier)
                                  .deleteItem(item.id);
                            },
                            child: ListTile(
                              leading: const Icon(Icons.history),
                              title: Text(
                                "${item.vf.toStringAsFixed(1)} mm/min",
                              ),
                              subtitle: Text(
                                "n: ${item.n.toInt()}, fz: ${item.fz}, z: ${item.z}",
                              ),
                              trailing: Text(
                                DateFormat('HH:mm').format(item.createdAt),
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
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
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
