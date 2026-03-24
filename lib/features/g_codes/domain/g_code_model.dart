import 'package:cnc_toolbox/features/g_codes/domain/g_code_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_code_model.freezed.dart';
part 'g_code_model.g.dart';

@freezed
sealed class GCode with _$GCode {
  const factory GCode({
    required String code,
    required String titleKey,
    required String descriptionKey,
    required String example,
  }) = _GCode;

  factory GCode.fromJson(Map<String, dynamic> json) => _$GCodeFromJson(json);
}

@freezed
sealed class GCodeState with _$GCodeState {
  const factory GCodeState({
    @Default('') String searchQuery,
    @Default([]) List<GCode> allCodes,
    @Default([]) List<GCodeViewModel> filteredCodes,
    @Default(true) bool isLoading,
  }) = _GCodeState;
}