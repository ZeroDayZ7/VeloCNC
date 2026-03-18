import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_calculation_dto.freezed.dart';

@freezed
sealed class FeedCalculationDto with _$FeedCalculationDto {
  const factory FeedCalculationDto({
    required double vf,
    required double adjustedVf,
    required double fz,
    required int z,
    required double n,
    required double toolDiameter,
    required double featureDiameter,
    required bool isInternal,
  }) = _FeedCalculationDto;
}