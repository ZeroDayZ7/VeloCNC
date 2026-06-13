import 'package:freezed_annotation/freezed_annotation.dart';

part 'thread_standard.freezed.dart';
part 'thread_standard.g.dart';

@freezed
sealed class ThreadStandard with _$ThreadStandard {
  const factory ThreadStandard({
    required String name, // np. "M", "MF", "UNC"
    required String description, // np. "Gwint metryczny zwykły"
    required List<ThreadSize> sizes,
  }) = _ThreadStandard;

  factory ThreadStandard.fromJson(Map<String, dynamic> json) =>
      _$ThreadStandardFromJson(json);
}

@freezed
sealed class ThreadSize with _$ThreadSize {
  const factory ThreadSize({
    required String label, // np. "M8"
    required double diameter, // 8.0
    required double pitch, // 1.25
    @Default(true) bool isMetric, // true dla M/MF, false dla calowych
  }) = _ThreadSize;

  factory ThreadSize.fromJson(Map<String, dynamic> json) =>
      _$ThreadSizeFromJson(json);
}
