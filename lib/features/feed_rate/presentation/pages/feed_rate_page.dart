import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/feed_rate/presentation/widgets/feed_rate_actions.dart';
import 'package:cnc_toolbox/features/feed_rate/presentation/widgets/feed_rate_form.dart';
import 'package:cnc_toolbox/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class FeedRatePage extends StatelessWidget {
  const FeedRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: AppScaffold(
        titleKey: LocaleKeys.tools_feed_rate,
        actions: [FeedRateActions()],
        scrollable: false,
        bottom: TabBar(
          tabs: [
            Tab(text: "Podstawowy", icon: Icon(Icons.calculate)),
            Tab(text: "Łuk / Otwór", icon: Icon(Icons.refresh)),
          ],
        ),
        child: TabBarView(
          children: [
            FeedRateForm(type: FeedType.basic),
            FeedRateForm(type: FeedType.arc),
          ],
        ),
      ),
    );
  }
}
