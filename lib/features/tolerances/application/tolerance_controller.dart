import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/features/tolerances/application/tolerance_provider.dart';
import 'package:cnc_toolbox/features/tolerances/application/tolerance_service.dart';
import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tolerance_controller.g.dart';

@Riverpod(keepAlive: true)
class ToleranceController extends _$ToleranceController {
  late final ToleranceService _service;

  @override
  FutureOr<TolerancePageState> build() async {
    _service = await ref.watch(toleranceServiceProvider.future);
    return _initialState();
  }

  TolerancePageState _initialState() {
    final letters = _service.getLetters(ToleranceType.hole);
    final initialLetter = letters.contains(ToleranceDefaults.holeLetter)
        ? ToleranceDefaults.holeLetter
        : (letters.isNotEmpty ? letters.first : null);

    List<String> numbers = [];
    String? initialNumber;

    if (initialLetter != null) {
      numbers = _service.getNumbersForLetter(ToleranceType.hole, initialLetter);
      initialNumber = numbers.contains(ToleranceDefaults.grade)
          ? ToleranceDefaults.grade
          : (numbers.isNotEmpty ? numbers.first : null);
    }

    return TolerancePageState(
      type: ToleranceType.hole,
      availableLetters: letters,
      selectedLetter: initialLetter,
      availableNumbers: numbers,
      selectedNumber: initialNumber,
    );
  }

  void updateType(ToleranceType newType) {
    state = state.whenData((s) {
      final letters = _service.getLetters(newType);

      String? letter;
      if (newType == ToleranceType.hole) {
        letter = letters.contains(ToleranceDefaults.holeLetter)
            ? ToleranceDefaults.holeLetter
            : (letters.isNotEmpty ? letters.first : null);
      } else {
        letter = letters.contains(ToleranceDefaults.shaftLetter)
            ? ToleranceDefaults.shaftLetter
            : (letters.isNotEmpty ? letters.first : null);
      }

      final newState = s.copyWith(
        type: newType,
        selectedLetter: letter,
        availableLetters: letters,
        result: null,
      );
      return _updateNumbersForState(newState);
    });
  }

  void updateDiameter(String value) {
    state = state.whenData((s) {
      final newState = s.copyWith(diameterInput: value);
      return _calculateForState(newState);
    });
  }

  void updateLetter(String? letter) {
    state = state.whenData((s) {
      final newState = s.copyWith(selectedLetter: letter, result: null);
      return _updateNumbersForState(newState);
    });
  }

  void updateNumber(String? number) {
    state = state.whenData((s) {
      final newState = s.copyWith(selectedNumber: number);
      return _calculateForState(newState);
    });
  }

  TolerancePageState _updateNumbersForState(TolerancePageState currentState) {
    if (currentState.selectedLetter == null) return currentState;

    final numbers = _service.getNumbersForLetter(
      currentState.type,
      currentState.selectedLetter!,
    );

    final nextState = currentState.copyWith(
      availableNumbers: numbers,
      selectedNumber: numbers.contains(ToleranceDefaults.grade)
          ? ToleranceDefaults.grade
          : (numbers.isNotEmpty ? numbers.first : null),
    );

    return _calculateForState(nextState);
  }

  TolerancePageState _calculateForState(TolerancePageState currentState) {
    final diameter = AppNumberFormatter.tryParse(currentState.diameterInput);
    if (diameter == null ||
        currentState.selectedLetter == null ||
        currentState.selectedNumber == null) {
      return currentState.copyWith(result: null);
    }

    final result = _service.calculate(
      diameter,
      currentState.selectedLetter!,
      currentState.selectedNumber!,
      currentState.type,
    );
    return currentState.copyWith(result: result);
  }
}
