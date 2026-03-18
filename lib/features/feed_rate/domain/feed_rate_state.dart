import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_rate_state.freezed.dart';

@freezed
sealed class FeedRateState with _$FeedRateState {
  const factory FeedRateState({
    @Default(0.0) double spindleSpeed,
    @Default(0.0) double feedPerTooth,
    @Default(1) int numberOfTeeth,
    @Default(0.0) double toolDiameter,
    @Default(0.0) double featureDiameter,
    @Default(true) bool isInternal,
  }) = _FeedRateState;
}
