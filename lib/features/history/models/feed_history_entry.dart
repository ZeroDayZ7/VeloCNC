// feed_history_entry.dart
class FeedHistoryEntry {
  final int id;
  final double spindleSpeed;
  final double feedPerTooth;
  final int teeth;
  final double resultVf;
  final double? toolDiameter;
  final double? featureDiameter;
  final DateTime createdAt;

  const FeedHistoryEntry({
    required this.id,
    required this.spindleSpeed,
    required this.feedPerTooth,
    required this.teeth,
    required this.resultVf,
    this.toolDiameter,
    this.featureDiameter,
    required this.createdAt,
  });
}
