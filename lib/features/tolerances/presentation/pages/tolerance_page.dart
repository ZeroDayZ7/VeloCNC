import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/tolerances/application/tolerance_controller.dart';
import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';
import 'package:cnc_toolbox/features/tolerances/presentation/widgets/tolerance_input_form.dart';
import 'package:cnc_toolbox/features/tolerances/presentation/widgets/tolerance_result_display.dart';
import 'package:cnc_toolbox/widgets/app_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TolerancePage extends ConsumerWidget {
  const TolerancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(toleranceControllerProvider);
    final notifier = ref.read(toleranceControllerProvider.notifier);

    return AppScaffold(
      titleKey: LocaleKeys.tools_tolerances,
      scrollable: false,
      child: stateAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text(err.toString())),
        data: (state) => SingleChildScrollView(
          padding: AppSpacings.edgeInsetsS,
          child: Column(
            children: [
              SegmentedButton<ToleranceType>(
                segments: [
                  ButtonSegment(
                    value: ToleranceType.hole,
                    label: Text(LocaleKeys.tolerance_hole.tr()),
                    icon: const Icon(Icons.circle_outlined),
                  ),
                  ButtonSegment(
                    value: ToleranceType.shaft,
                    label: Text(LocaleKeys.tolerance_shaft.tr()),
                    icon: const Icon(Icons.panorama_fish_eye),
                  ),
                ],
                selected: {state.type},
                onSelectionChanged: (set) => notifier.updateType(set.first),
              ),
              AppSpacings.gapM,
              ToleranceInputForm(
                diameterInitialValue: state.diameterInput,
                selectedType: state.type,
                selectedLetter: state.selectedLetter,
                selectedNumber: state.selectedNumber,
                letters: state.availableLetters,
                numbers: state.availableNumbers,
                onDiameterChanged: notifier.updateDiameter,
                onLetterChanged: notifier.updateLetter,
                onNumberChanged: notifier.updateNumber,
              ),
              AppSpacings.gapL,
              if (state.result != null)
                ToleranceResultDisplay(res: state.result!),
            ],
          ),
        ),
      ),
    );
  }
}
