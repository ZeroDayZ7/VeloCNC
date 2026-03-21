import 'package:cnc_toolbox/features/tolerances/application/tolerance_service.dart';
import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'tolerance_provider.dart';

part 'tolerance_controller.g.dart';

@riverpod
class ToleranceController extends _$ToleranceController {
  @override
  TolerancePageState build() {
    final service = ref.watch(toleranceServiceProvider).value;
    if (service == null) return const TolerancePageState();

    return _initialState(service);
  }

  TolerancePageState _initialState(ToleranceService service) {
    final letters = service.getLetters(ToleranceType.hole);
    final initialLetter = letters.contains('H')
        ? 'H'
        : (letters.isNotEmpty ? letters.first : null);

    List<String> numbers = [];
    String? initialNumber;

    if (initialLetter != null) {
      numbers = service.getNumbersForLetter(ToleranceType.hole, initialLetter);
      initialNumber = numbers.contains('7')
          ? '7'
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
    final service = ref.read(toleranceServiceProvider).requireValue;
    final letters = service.getLetters(newType);
    final letter = letters.contains('H')
        ? 'H'
        : (letters.contains('h')
              ? 'h'
              : (letters.isNotEmpty ? letters.first : null));

    state = state.copyWith(
      type: newType,
      selectedLetter: letter,
      availableLetters: letters,
      result: null,
    );
    _updateNumbers();
  }

  void updateDiameter(String value) {
    state = state.copyWith(diameterInput: value);
    _calculate();
  }

  void updateLetter(String? letter) {
    state = state.copyWith(selectedLetter: letter, result: null);
    _updateNumbers();
  }

  void updateNumber(String? number) {
    state = state.copyWith(selectedNumber: number);
    _calculate();
  }

  void _updateNumbers() {
    if (state.selectedLetter == null) return;
    final service = ref.read(toleranceServiceProvider).requireValue;
    final numbers = service.getNumbersForLetter(
      state.type,
      state.selectedLetter!,
    );

    state = state.copyWith(
      availableNumbers: numbers,
      selectedNumber: numbers.contains('7')
          ? '7'
          : (numbers.isNotEmpty ? numbers.first : null),
    );
    _calculate();
  }

  void _calculate() {
    final diameter = double.tryParse(state.diameterInput);
    if (diameter == null ||
        state.selectedLetter == null ||
        state.selectedNumber == null) {
      state = state.copyWith(result: null);
      return;
    }

    final service = ref.read(toleranceServiceProvider).requireValue;
    final result = service.calculate(
      diameter,
      state.selectedLetter!,
      state.selectedNumber!,
      state.type,
    );
    state = state.copyWith(result: result);
  }
}
