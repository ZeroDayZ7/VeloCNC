// lib/features/tolerances/application/tolerance_provider.dart

import 'package:cnc_toolbox/features/tolerances/application/tolerance_service.dart';
import 'package:cnc_toolbox/features/tolerances/data/tolerance_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tolerance_provider.g.dart';

@Riverpod(keepAlive: true)
Future<ToleranceService> toleranceService(Ref ref) async {
  final repository = ref.watch(toleranceRepositoryProvider);
  final data = await repository.loadTolerances();

  return ToleranceService(data);
}
