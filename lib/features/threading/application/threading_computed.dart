import 'package:cnc_toolbox/features/threading/application/threading_math.dart';
import 'package:cnc_toolbox/features/threading/application/threading_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'threading_computed.g.dart';

@riverpod
double threadingRpm(Ref ref) {
  final state = ref.watch(threadingProvider);

  if (state.selectedSubgroup == null || state.selectedThread == null) return 0;
  if (state.selectedThread!.diameter <= 0) return 0;

  final vc = state.toolMaterial == 'VHM'
      ? state.selectedSubgroup!.vcVhm
      : state.selectedSubgroup!.vcHss;

  return ThreadingMath.calculateRPM(
    vc: vc,
    diameter: state.selectedThread!.diameter,
  ).toDouble();
}

@riverpod
double threadingHoleSize(Ref ref) {
  final state = ref.watch(threadingProvider);

  if (state.selectedThread == null) return 0;
  if (state.selectedThread!.diameter <= 0 || state.selectedThread!.pitch <= 0) {
    return 0;
  }

  if (state.isCutting) {
    return ThreadingMath.holeSizeCutting(
      nominalDiameter: state.selectedThread!.diameter,
      pitch: state.selectedThread!.pitch,
    );
  } else {
    return ThreadingMath.holeSizeForming(
      nominalDiameter: state.selectedThread!.diameter,
      pitch: state.selectedThread!.pitch,
    );
  }
}
