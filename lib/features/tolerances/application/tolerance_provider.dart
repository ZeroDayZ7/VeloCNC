import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/features/tolerances/application/tolerance_service.dart';
import 'package:cnc_toolbox/features/tolerances/data/tolerance_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tolerance_provider.g.dart';

@Riverpod(keepAlive: true)
Future<ToleranceService> toleranceService(Ref ref) async {
  final repository = ref.watch(toleranceRepositoryProvider);
  final result = await repository.loadTolerances();

  return switch (result) {
    Success(data: final data) => ToleranceService(data),
    Failure(error: final e) => throw e,
  };
}
