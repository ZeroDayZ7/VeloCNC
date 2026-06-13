// lib/features/converter/data/units_repository.dart
import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';

/// Helper factory for creating linear unit transformations.
///
/// Uses a [ratio] to convert values to and from a common base unit.
/// This simplifies the addition of new units by only requiring their
/// relationship to the base (e.g., Meters for length, Bars for pressure).
UnitDefinition _linear(String id, String label, String symbol, double ratio) {
  return UnitDefinition(
    id: id,
    label: label,
    symbol: symbol,
    toBase: (val) => val * ratio,
    fromBase: (val) => val / ratio,
  );
}

/// Unit definitions for length, where **Meters (m)** is the base unit.
final List<UnitDefinition> lengthUnits = [
  _linear(UnitIds.meter, LocaleKeys.converter_units_m, UnitIds.symbolMeter, UnitConstants.mToM),
  _linear(UnitIds.millimeter, LocaleKeys.converter_units_mm, UnitIds.symbolMillimeter, UnitConstants.mmToM),
  _linear(UnitIds.micrometer, LocaleKeys.converter_units_um, UnitIds.symbolMicrometer, UnitConstants.umToM),
  _linear(UnitIds.kilometer, LocaleKeys.converter_units_km, UnitIds.symbolKilometer, UnitConstants.kmToM),
  _linear(UnitIds.inch, LocaleKeys.converter_units_inch, UnitIds.symbolInch, UnitConstants.inchToM),
];

/// Unit definitions for temperature.
///
/// Unlike linear units, temperature requires custom [toBase] and [fromBase]
/// logic due to varying zero-point offsets (e.g., Celsius to Kelvin).
/// **Celsius (°C)** is used as the internal base unit for calculations.
final List<UnitDefinition> tempUnits = [
  UnitDefinition(
    id: 'celsius',
    label: LocaleKeys.converter_units_celsius,
    symbol: '°C',
    toBase: (val) => val,
    fromBase: (val) => val,
  ),
  UnitDefinition(
    id: 'fahrenheit',
    label: LocaleKeys.converter_units_fahrenheit,
    symbol: '°F',
    toBase: (val) => (val - 32) / 1.8,
    fromBase: (val) => (val * 1.8) + 32,
  ),
  UnitDefinition(
    id: 'kelvin',
    label: LocaleKeys.converter_units_kelvin,
    symbol: 'K',
    toBase: (val) => val - 273.15,
    fromBase: (val) => val + 273.15,
  ),
];

/// Unit definitions for velocity, where **Meters per second (m/s)** is the base unit.
/// Crucial for CNC spindle and feed rate conversions.
final List<UnitDefinition> speedUnits = [
  _linear('m_s', LocaleKeys.converter_units_m_s, 'm/s', 1.0),
  _linear('km_h', LocaleKeys.converter_units_km_h, 'km/h', 1 / 3.6),
  _linear('mm_min', LocaleKeys.converter_units_mm_min, 'mm/min', 0.001 / 60),
  _linear('mm_s', LocaleKeys.converter_units_mm_s, 'mm/s', 0.001),
  _linear('in_min', LocaleKeys.converter_units_in_min, 'in/min', 0.0254 / 60),
];

/// Unit definitions for pressure, where **Bar** is the base unit.
/// Useful for coolant and hydraulic system monitoring.
final List<UnitDefinition> pressureUnits = [
  _linear('bar', LocaleKeys.converter_units_bar, 'bar', 1.0),
  _linear('psi', LocaleKeys.converter_units_psi, 'psi', 0.0689476),
  _linear('pa', LocaleKeys.converter_units_pa, 'Pa', 0.00001),
  _linear('mpa', LocaleKeys.converter_units_mpa, 'MPa', 10.0),
  _linear('atm', LocaleKeys.converter_units_atm, 'atm', 1.01325),
];
