import 'package:cnc_toolbox/features/threading/data/models/material_iso.dart';
import 'package:cnc_toolbox/features/threading/data/models/thread_standard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'threading_state.freezed.dart';

@freezed
sealed class ThreadingState with _$ThreadingState {
  const factory ThreadingState({
    IsoMaterialGroup? selectedMaterial,
    IsoSubgroup? selectedSubgroup,
    ThreadSize? selectedThread,
    @Default(true) bool isCutting,
    @Default('VHM') String toolMaterial,
  }) = _ThreadingState;
}