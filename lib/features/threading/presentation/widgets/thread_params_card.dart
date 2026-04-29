import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/threading/application/threading_notifier.dart';
import 'package:cnc_toolbox/features/threading/data/models/thread_standard.dart';
import 'package:cnc_toolbox/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThreadingParamsCard extends ConsumerWidget {
  const ThreadingParamsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(threadingProvider);
    final notifier = ref.read(threadingProvider.notifier);

    return Card(
      child: Padding(
        padding: AppSpacings.edgeInsetsM,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            AppSpacings.gapL,
            if (state.selectedMaterial != null) ...[
              const Text(
                'PODGRUPA MATERIAŁOWA:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: state.selectedSubgroup?.id,
                items: state.selectedMaterial!.subgroups.map((sub) {
                  return DropdownMenuItem(
                    value: sub.id,
                    child: Text(
                      '${sub.id} - ${sub.type}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: (id) {
                  final sub = state.selectedMaterial!.subgroups.firstWhere(
                    (s) => s.id == id,
                  );
                  notifier.selectSubgroup(sub);
                },
              ),
              AppSpacings.gapL,
            ],
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
            AppSpacings.gapL,
            CustomField(
              label: 'ŚREDNICA',
              suffix: 'mm',
              onChanged: (v) {
                final d = double.tryParse(v) ?? 0;
                notifier.selectThread(
                  ThreadSize(
                    label: 'Manual',
                    diameter: d,
                    pitch: state.selectedThread?.pitch ?? 0,
                  ),
                );
              },
            ),
            AppSpacings.gapM,
            CustomField(
              label: 'SKOK',
              suffix: 'mm',
              onChanged: (v) {
                final p = double.tryParse(v) ?? 0;
                notifier.selectThread(
                  ThreadSize(
                    label: 'Manual',
                    diameter: state.selectedThread?.diameter ?? 0,
                    pitch: p,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
