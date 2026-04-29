import 'package:cnc_toolbox/features/threading/application/threading_notifier.dart';
import 'package:cnc_toolbox/features/threading/presentation/widgets/material_selector.dart';
import 'package:cnc_toolbox/features/threading/presentation/widgets/results_hero_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThreadingPage extends ConsumerWidget {
  const ThreadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(threadingProvider);
    final notifier = ref.read(threadingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KALKULATOR GWINTOWANIA'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ResultsHeroSection(),

            const SizedBox(height: 24),

            MaterialSelector(
              groups: const [],
              selectedGroupId: state.selectedMaterial?.groupId,
              onGroupSelected: (group) => notifier.selectMaterial(group),
            ),

            const SizedBox(height: 24),

            _buildParamsCard(context, ref),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildParamsCard(BuildContext context, WidgetRef ref) {
    final state = ref.watch(threadingProvider);
    final notifier = ref.read(threadingProvider.notifier);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(
                  value: true,
                  label: Text('NACINANIE'),
                  icon: Icon(Icons.content_cut),
                ),
                ButtonSegment(
                  value: false,
                  label: Text('WYGNIATANIE'),
                  icon: Icon(Icons.auto_awesome_motion),
                ),
              ],
              selected: {state.isCutting},
              onSelectionChanged: (value) => notifier.toggleMethod(value.first),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'MATERIAŁ NARZĘDZIA:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: state.toolMaterial,
                  items: const [
                    DropdownMenuItem(value: 'VHM', child: Text('VHM (Węglik)')),
                    DropdownMenuItem(
                      value: 'HSS',
                      child: Text('HSS (Stal szybkotnąca)'),
                    ),
                  ],
                  onChanged: (value) =>
                      notifier.setToolMaterial(value ?? 'VHM'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
