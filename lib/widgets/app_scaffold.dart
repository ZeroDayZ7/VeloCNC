import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/core/utils/responsive_utils.dart';
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:cnc_toolbox/widgets/responsive_container.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final Widget? sidebar;
  final String? titleKey;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final ContainerSize size;
  final bool scrollable;
  final bool useSafeArea;

  const AppScaffold({
    super.key,
    required this.child,
    this.sidebar,
    this.titleKey,
    this.actions,
    this.bottom,
    this.size = ContainerSize.medium,
    this.scrollable = true,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;

    // 1. Definicja lokalna (bez podkreślenia)
    PreferredSizeWidget? buildAppBar() {
      if (titleKey == null) return null;
      return CncAppBar(titleKey: titleKey!, actions: actions, bottom: bottom);
    }

    Widget content = ResponsiveContainer(
      size: size,
      child: scrollable ? SingleChildScrollView(child: child) : child,
    );

    if (useSafeArea) content = SafeArea(child: content);

    if (isDesktop) {
      return Scaffold(
        body: Row(
          children: [
            if (sidebar != null)
              SizedBox(width: AppBreakpoints.sidebarWidth, child: sidebar),
            if (sidebar != null) const VerticalDivider(width: 1),
            Expanded(
              child: Scaffold(appBar: buildAppBar(), body: content),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: buildAppBar(),
      drawer: sidebar != null ? Drawer(child: sidebar) : null,
      body: content,
    );
  }
}
