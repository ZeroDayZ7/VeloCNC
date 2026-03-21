import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/converter/data/units_repository.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:flutter/material.dart';

/// Central registry of all unit conversion categories available in the app.
///
/// This data-driven approach allows the UI to dynamically generate category
/// cards and navigation items based on this list, making the system
/// easily extendable with new physical quantities.
final List<ConverterCategory> converterCategories = [
  /// Length and distance measurements (e.g., mm, inches).
  ConverterCategory(
    id: ConverterGroup.length,
    icon: Icons.straighten,
    label: LocaleKeys.converter_categories_length,
    units: lengthUnits,
  ),

  /// Thermal units crucial for material science and machining environments.
  ConverterCategory(
    id: ConverterGroup.temperature,
    icon: Icons.thermostat,
    label: LocaleKeys.converter_categories_temp,
    units: tempUnits,
  ),

  /// Velocity units for feed rates and cutting speeds.
  ConverterCategory(
    id: ConverterGroup.speed,
    icon: Icons.speed,
    label: LocaleKeys.converter_categories_speed,
    units: speedUnits,
  ),

  /// Pressure units (e.g., Bar, PSI) used in hydraulic and pneumatic systems.
  ConverterCategory(
    id: ConverterGroup.pressure,
    icon: Icons.compress,
    label: LocaleKeys.converter_categories_pressure,
    units: pressureUnits,
  ),
];
