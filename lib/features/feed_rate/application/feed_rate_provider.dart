import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_state.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/domain/feed_history_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_provider.g.dart';

@Riverpod(keepAlive: true)
class FeedRateNotifier extends _$FeedRateNotifier {
  @override
  FeedRateState build(FeedType type) => const FeedRateState();

  void loadFromHistory(FeedHistoryItem entry) {
    state = state.copyWith(
      spindleSpeed: entry.n,
      feedPerTooth: entry.fz,
      numberOfTeeth: entry.z,
      toolDiameter: 0,
      featureDiameter: 0,
    );
  }

  void updateSpindleSpeed(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    if (val != null) state = state.copyWith(spindleSpeed: val);
  }

  void updateFeedPerTooth(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    if (val != null) state = state.copyWith(feedPerTooth: val);
  }

  void updateTeeth(String rawValue) {
    final val = int.tryParse(rawValue);
    if (val != null) state = state.copyWith(numberOfTeeth: val);
  }

  void updateToolDia(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    if (val != null) state = state.copyWith(toolDiameter: val);
  }

  void updateFeatureDia(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    if (val != null) state = state.copyWith(featureDiameter: val);
  }

  void toggleWorkType(bool isInternal) =>
      state = state.copyWith(isInternal: isInternal);
}
