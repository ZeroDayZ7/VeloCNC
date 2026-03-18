import 'package:cnc_toolbox/features/converter/application/converter_provider.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConverterInputs extends HookConsumerWidget {
  final List<UnitDefinition> units;
  final ConverterCategory category;

  const ConverterInputs({
    super.key,
    required this.units,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(converterProvider(category));

    // 1. Inicjalizacja kontrolerów tylko raz
    final controllers = useMemoized(
      () => {for (var u in units) u.id: TextEditingController()},
      [units], // Re-inicjalizuj tylko jeśli lista jednostek się zmieni
    );

    // 2. Automatyczny dispose
    useEffect(() {
      return () {
        for (final controller in controllers.values) {
          controller.dispose();
        }
      };
    }, [controllers]);

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: units.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final unit = units[index];
        final value = state.values[unit.id] ?? "";
        final controller = controllers[unit.id]!;

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
