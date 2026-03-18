import 'package:freezed_annotation/freezed_annotation.dart';

part 'tolerance_models.freezed.dart';
part 'tolerance_models.g.dart';

enum ToleranceType { hole, shaft }

@freezed
abstract class ToleranceRange with _$ToleranceRange {
  const factory ToleranceRange({
    required double min,
    required double max,
    double? upper,
    double? lower,
    @JsonKey(name: 'restriction_key') String? restrictionKey,
    @JsonKey(name: 'info_key') String? infoKey,
  }) = _ToleranceRange;

  factory ToleranceRange.fromJson(Map<String, dynamic> json) =>
      _$ToleranceRangeFromJson(json);
}

@freezed
abstract class ToleranceResult with _$ToleranceResult {
  const factory ToleranceResult({
    required double? upperDeviation,
    required double? lowerDeviation,
    required double? minSize,
    required double? maxSize,
    String? restrictionKey,
    String? infoKey,
  }) = _ToleranceResult;
}