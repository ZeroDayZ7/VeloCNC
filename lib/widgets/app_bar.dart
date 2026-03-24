import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CncAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleKey;
  final bool showBackButton;
  final List<Widget>? actions;
  final VoidCallback? onBackPress;
  final PreferredSizeWidget? bottom;

  const CncAppBar({
    super.key,
    required this.titleKey,
    this.showBackButton = true,
    this.actions,
    this.onBackPress,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleKey).tr(),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed:
                  onBackPress ??
                  () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      const HomeRoute().go(context);
                    }
                  },
            )
          : null,
      actions: actions != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(mainAxisSize: MainAxisSize.min, children: actions!),
              ),
            ]
          : null,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
