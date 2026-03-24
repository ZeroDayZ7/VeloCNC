import 'package:freezed_annotation/freezed_annotation.dart';

part 'tolerance_models.freezed.dart';
part 'tolerance_models.g.dart';

enum ToleranceType { hole, shaft }

@freezed
sealed class TolerancePageState with _$TolerancePageState {
  const factory TolerancePageState({
    @Default(ToleranceType.hole) ToleranceType type,
    @Default('') String diameterInput,
    String? selectedLetter,
    String? selectedNumber,
    ToleranceResult? result,
    @Default([]) List<String> availableLetters,
    @Default([]) List<String> availableNumbers,
  }) = _TolerancePageState;
}

@freezed
sealed class ToleranceRange with _$ToleranceRange {
  const factory ToleranceRange({
    @Default(0.0) double min,
    @Default(0.0) double max,
    double? upper,
    double? lower,
    @JsonKey(name: 'restriction_key') String? restrictionKey,
    @JsonKey(name: 'info_key') String? infoKey,
  }) = _ToleranceRange;

  factory ToleranceRange.fromJson(Map<String, dynamic> json) =>
      _$ToleranceRangeFromJson(json);
}

@freezed
sealed class ToleranceResult with _$ToleranceResult {
  const factory ToleranceResult({
    double? upperDeviation,
    double? lowerDeviation,
    double? minSize,
    double? maxSize,
    String? restrictionKey,
    String? infoKey,
  }) = _ToleranceResult;
}

@freezed
sealed class ToleranceData with _$ToleranceData {
  const factory ToleranceData({
    required Map<String, List<ToleranceRange>> holes,
    required Map<String, List<ToleranceRange>> shafts,
  }) = _ToleranceData;

  factory ToleranceData.fromJson(Map<String, dynamic> json) =>
      _$ToleranceDataFromJson(json);
}
