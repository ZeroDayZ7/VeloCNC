import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/domain/history_notifier.dart';
import 'package:cnc_toolbox/features/history/presentation/widgets/history_header.dart';
import 'package:cnc_toolbox/features/history/presentation/widgets/history_list.dart';
import 'package:cnc_toolbox/widgets/empty_state_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistorySheet extends ConsumerWidget {
  final FeedType targetType;

  const HistorySheet({super.key, required this.targetType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              HistoryHeader(hasData: history.isNotEmpty),
              Expanded(
                child: history.isEmpty
                    ? Center(child: Text(LocaleKeys.common_no_data.tr()))
                    : HistoryList(
                        history: history,
                        targetType: targetType,
                        scrollController: scrollController,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
