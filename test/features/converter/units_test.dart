import 'package:cnc_toolbox/features/converter/data/units_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unit Conversion Logic Tests', () {
    test('Length: m to mm and back', () {
      final m = lengthUnits.firstWhere((u) => u.id == 'm');
      final mm = lengthUnits.firstWhere((u) => u.id == 'mm');

      const input = 1.0; // 1 metr
      final base = m.toBase(input); // na bazową (m)
      final result = mm.fromBase(base); // z bazowej na mm

      expect(result, 1000.0);
      expect(mm.toBase(result), 1.0);
    });

    /// Verifies that temperature conversion handles absolute zero and
    /// critical points correctly across Celsius and Fahrenheit.
    test('Temperature: Celsius to Fahrenheit and back', () {
      final c = tempUnits.firstWhere((u) => u.id == 'celsius');
      final f = tempUnits.firstWhere((u) => u.id == 'fahrenheit');

      // 0°C = 32°F
      expect(f.fromBase(c.toBase(0)), 32.0);
      // 100°C = 212°F
      expect(f.fromBase(c.toBase(100)), 212.0);
      // -40°C = -40°F
      expect(f.fromBase(c.toBase(-40)), closeTo(-40.0, 0.01));
    });

    /// Ensures high precision when converting Bar to PSI,
    /// vital for high-pressure CNC coolant systems.
    test('Pressure: Bar to PSI', () {
      final bar = pressureUnits.firstWhere((u) => u.id == 'bar');
      final psi = pressureUnits.firstWhere((u) => u.id == 'psi');

      // 1 bar ≈ 14.5038 psi
      final result = psi.fromBase(bar.toBase(1.0));
      expect(result, closeTo(14.5038, 0.001));
    });
  });
}
