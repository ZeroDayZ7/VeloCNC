import 'dart:convert';

import 'package:cnc_toolbox/core/constants/generated/assets.gen.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tolerance_repository.g.dart';

typedef ToleranceMap = Map<ToleranceType, Map<String, List<ToleranceRange>>>;

abstract class IToleranceRepository {
  Future<Result<ToleranceMap>> loadTolerances();
}

class ToleranceRepository implements IToleranceRepository {
  @override
  Future<Result<ToleranceMap>> loadTolerances() async {
    try {
      final jsonString = await rootBundle.loadString(Assets.data.tolerances);
      final Map<String, dynamic> decoded =
          json.decode(jsonString) as Map<String, dynamic>;

      final data = ToleranceData.fromJson(decoded);

      final ToleranceMap resultMap = {
        ToleranceType.hole: data.holes,
        ToleranceType.shaft: data.shafts,
      };

      return Success(resultMap);
    } catch (e, st) {
      return Failure(e, st);
    }
  }
}

@Riverpod(keepAlive: true)
IToleranceRepository toleranceRepository(Ref ref) => ToleranceRepository();
