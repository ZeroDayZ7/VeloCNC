import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/presentation/widgets/gd_symbols_grid.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/presentation/widgets/gd_symbols_info_modal.dart';
import 'package:cnc_toolbox/widgets/app_scaffold.dart'; // Importujemy nasz nowy scaffold
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GdSymbolsPage extends StatelessWidget {
  const GdSymbolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      titleKey: LocaleKeys.gd_symbols_title,
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          tooltip: LocaleKeys.gd_symbols_modal_title.tr(),
          onPressed: () => GdSymbolsInfoModal.show(context),
        ),
      ],
      scrollable: false,
      child: const GdSymbolsGrid(),
    );
  }
}
