// features/converter/domain/converter_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'converter_state.freezed.dart';

/// Represents the immutable state of a specific converter category.
///
/// Uses the [Freezed] package to ensure type safety and provide
/// deep copy capabilities, which is essential for [Riverpod] to
/// detect state changes efficiently.
@freezed
sealed class ConverterState with _$ConverterState {
  /// Default factory for [ConverterState].
  const factory ConverterState({
    /// A map of calculated values where the key is the unit ID
    /// and the value is the formatted string for the UI.
    @Default({}) Map<String, String> values,

    /// A list of unit IDs marked as favorites or pinned by the user
    /// for quicker access within this category.
    @Default([]) List<String> favoriteUnits,
  }) = _ConverterState;
}
