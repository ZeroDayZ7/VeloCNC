import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_init_status.freezed.dart';

@freezed
sealed class AppInitStatus with _$AppInitStatus {
  const factory AppInitStatus.loading({String? messageKey}) = _Loading;

  const factory AppInitStatus.ready() = _Ready;

  const factory AppInitStatus.blocked({String? reason}) = _Blocked;
}