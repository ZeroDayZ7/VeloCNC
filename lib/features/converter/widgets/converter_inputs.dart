import 'package:cnc_toolbox/features/converter/application/converter_provider.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConverterInputs extends ConsumerWidget {
  final List<UnitDefinition> units;
  final Map<String, TextEditingController> controllers;
  final ConverterCategory category;

  const ConverterInputs({
    super.key,
    required this.units,
    required this.controllers,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(converterProvider(category));

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: units.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final unit = units[index];
        final value = state.values[unit.id] ?? "";

        final controller = controllers.putIfAbsent(
          unit.id,
          () => TextEditingController(),
        );

        if (controller.text != value && !FocusScope.of(context).hasFocus) {
          controller.text = value;
        }

        return TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: unit.label.tr(),
            suffixText: unit.symbol,
          ),
          onChanged: (val) => ref
              .read(converterProvider(category).notifier)
              .updateValue(unit.id, val, units),
        );
      },
    );
  }
}
