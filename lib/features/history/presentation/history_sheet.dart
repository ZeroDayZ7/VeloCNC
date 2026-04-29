import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/domain/history_notifier.dart';
import 'package:cnc_toolbox/features/history/presentation/widgets/history_header.dart';
import 'package:cnc_toolbox/features/history/presentation/widgets/history_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistorySheet extends ConsumerWidget {
  final FeedType targetType;

  const HistorySheet({super.key, required this.targetType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasItems = ref.watch(
      historyProvider.select((s) => s.asData?.value.isNotEmpty ?? false),
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            HistoryHeader(hasData: hasItems),
            Expanded(
              child: !hasItems
                  ? Center(child: Text(LocaleKeys.common_no_data.tr()))
                  : Consumer(
                      builder: (context, ref, child) {
                        final history =
                            ref.watch(historyProvider).asData?.value ?? [];
                        return HistoryList(
                          history: history,
                          targetType: targetType,
                          scrollController: scrollController,
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
