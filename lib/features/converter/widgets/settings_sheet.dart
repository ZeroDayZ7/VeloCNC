import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/converter/application/converter_settings_provider.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsSheet extends StatelessWidget {
  final String categoryId;
  final List<UnitDefinition> units;

  const SettingsSheet({
    super.key,
    required this.categoryId,
    required this.units,
  });

  static void show(
    BuildContext context,
    String categoryId,
    List<UnitDefinition> units,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SettingsSheet(categoryId: categoryId, units: units),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.converter_input.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(LocaleKeys.converter_result.tr()),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: units.length,
              itemBuilder: (context, index) {
                return _UnitCheckboxTile(
                  categoryId: categoryId,
                  unit: units[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              LocaleKeys.converter_settings_hint.tr(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _UnitCheckboxTile extends ConsumerWidget {
  final String categoryId;
  final UnitDefinition unit;

  const _UnitCheckboxTile({required this.categoryId, required this.unit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(
      settingsProvider.select(
        (s) => s.isUnitVisible(categoryId, unit.id),
      ),
    );

    return CheckboxListTile(
      title: Text(unit.label.tr()),
      secondary: Text(
        unit.symbol,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      value: isVisible,
      onChanged: (_) {
        ref
            .read(settingsProvider.notifier)
            .toggleUnit(categoryId, unit.id);
      },
    );
  }
}
