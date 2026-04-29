import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/threading/application/threading_notifier.dart';
import 'package:cnc_toolbox/features/threading/data/models/material_iso.dart';
import 'package:cnc_toolbox/features/threading/data/repositories/thread_repository.dart';
import 'package:cnc_toolbox/features/threading/presentation/widgets/material_selector.dart';
import 'package:cnc_toolbox/features/threading/presentation/widgets/results_hero_section.dart';
import 'package:cnc_toolbox/features/threading/presentation/widgets/thread_params_card.dart';
import 'package:cnc_toolbox/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final materialsListProvider = FutureProvider<List<IsoMaterialGroup>>((
  ref,
) async {
  return ref.watch(threadRepositoryProvider).loadMaterials();
});

class ThreadingPage extends ConsumerWidget {
  const ThreadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final materialsAsync = ref.watch(materialsListProvider);
    final state = ref.watch(threadingProvider);
    final notifier = ref.read(threadingProvider.notifier);

    ref.listen(materialsListProvider, (previous, next) {
      if (next is AsyncData<List<IsoMaterialGroup>> && next.value.isNotEmpty) {
        ref.read(threadingProvider.notifier).initMaterials();
      }
    });

    return AppScaffold(
      titleKey: 'threading_calculator',
      size: ContainerSize.full,
      scrollable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ResultsHeroSection(),
          AppSpacings.gapL,
          materialsAsync.when(
            data: (groups) => MaterialSelector(
              groups: groups,
              selectedGroupId: state.selectedMaterial?.groupId,
              onGroupSelected: (group) => notifier.selectMaterial(group),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
          ),
          AppSpacings.gapL,
          const ThreadingParamsCard(),
        ],
      ),
    );
  }
}
