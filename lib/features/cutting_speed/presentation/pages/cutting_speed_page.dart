import 'package:cnc_toolbox/core/localization/locale_keys.g.dart'; // Import kluczy
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class CuttingSpeedPage extends StatelessWidget {
  const CuttingSpeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      titleKey: LocaleKeys.tools_cutting_speed,
      size: ContainerSize.narrow,

      child: Center(child: Text('Cutting Speed Content')),
    );
  }
}
