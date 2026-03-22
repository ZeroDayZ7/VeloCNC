import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_controller.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'feed_history_sheet.dart';

class FeedRateActions extends ConsumerWidget {
  const FeedRateActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.history),
          tooltip: 'Historia obliczeń',
          onPressed: () {
            final tabIndex = DefaultTabController.of(context).index;
            final type = tabIndex == 0 ? FeedType.basic : FeedType.arc;
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => FeedHistorySheet(targetType: type),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.save),
          tooltip: 'Zapisz parametry',
          onPressed: () async {
            final tabIndex = DefaultTabController.of(context).index;
            final type = tabIndex == 0 ? FeedType.basic : FeedType.arc;
            await ref.read(feedRateControllerProvider.notifier).save(type);
            if (context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Zapisano ($type)')));
            }
          },
        ),
      ],
    );
  }
}
