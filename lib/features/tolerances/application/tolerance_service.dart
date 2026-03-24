import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';

class ToleranceService {
  final Map<ToleranceType, Map<String, List<ToleranceRange>>> data;

  ToleranceService(this.data);

  List<String> getLetters(ToleranceType type) {
    return data[type]!.keys
        .map((e) => e.replaceAll(RegExp(r'[0-9]'), ''))
        .toSet()
        .toList()
      ..sort();
  }

  List<String> getNumbersForLetter(ToleranceType type, String letter) {
    return data[type]!.keys
        .where((e) => e.startsWith(letter))
        .map((e) => e.replaceFirst(letter, ''))
        .where((e) => int.tryParse(e) != null)
        .toList()
      ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
  }

  ToleranceResult? calculate(
    double diameter,
    String letter,
    String number,
    ToleranceType type,
  ) {
    final grade = '$letter$number';
    final ranges = data[type]![grade];
    if (ranges == null) return null;

    for (final range in ranges) {
      if (diameter > range.min && diameter <= range.max) {
        return ToleranceResult(
          upperDeviation: range.upper,
          lowerDeviation: range.lower,
          minSize: range.lower != null ? diameter + (range.lower! / 1000) : null,
          maxSize: range.upper != null ? diameter + (range.upper! / 1000) : null,
          restrictionKey: range.restrictionKey,
          infoKey: range.infoKey,
        );
      }
    }
    return null;
  }
}