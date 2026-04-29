import 'package:cnc_toolbox/features/threading/data/models/material_iso.dart';
import 'package:cnc_toolbox/features/threading/data/models/thread_standard.dart';
import 'package:cnc_toolbox/features/threading/data/models/threading_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'threading_notifier.g.dart';

@riverpod
class ThreadingNotifier extends _$ThreadingNotifier {
  @override
  ThreadingState build() => const ThreadingState();

  void selectMaterial(IsoMaterialGroup material) {
    state = state.copyWith(
      selectedMaterial: material,
      selectedSubgroup: material.subgroups.isNotEmpty
          ? material.subgroups.first
          : null,
    );
  }

  void selectSubgroup(IsoSubgroup subgroup) {
    state = state.copyWith(selectedSubgroup: subgroup);
  }

  void selectThread(ThreadSize thread) {
    state = state.copyWith(selectedThread: thread);
  }

  void toggleMethod(bool isCutting) {
    state = state.copyWith(isCutting: isCutting);
  }

  void setToolMaterial(String type) {
    state = state.copyWith(toolMaterial: type);
  }
}
