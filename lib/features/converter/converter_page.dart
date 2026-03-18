import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/converter/application/converter_settings_provider.dart';
import 'package:cnc_toolbox/features/converter/data/units_data.dart';
import 'package:cnc_toolbox/features/converter/widgets/converter_inputs.dart';
import 'package:cnc_toolbox/features/converter/widgets/converter_sidebar.dart';
import 'package:cnc_toolbox/features/converter/widgets/settings_sheet.dart';
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConverterPage extends ConsumerStatefulWidget {
  const ConverterPage({super.key});

  @override
  ConsumerState<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends ConsumerState<ConverterPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final currentCat = converterCategories[_selectedIndex];
    final visibleUnits = settings.getVisibleUnitsForCategory(currentCat);

    return Scaffold(
      appBar: CncAppBar(
        titleKey: LocaleKeys.tools_unit_converter,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () => SettingsSheet.show(
              context,
              currentCat.id.name,
              currentCat.units,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          ConverterSidebar(
            isExpanded: settings.isSidebarExpanded,
            selectedIndex: _selectedIndex,
            categories: converterCategories,
            onSelect: (index) => setState(() {
              _selectedIndex = index;
            }),
            onToggle: () => ref.read(settingsProvider.notifier).toggleSidebar(),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: ConverterInputs(units: visibleUnits, category: currentCat),
          ),
        ],
      ),
    );
  }
}
