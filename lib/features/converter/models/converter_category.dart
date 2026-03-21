// lib/features/converter/data/models/converter_category.dart
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:flutter/material.dart';

/// Defines the physical quantities supported by the application.
///
/// Used to categorize units and drive the navigation and filtering
/// logic across the converter feature.
enum ConverterGroup { length, weight, temperature, pressure, speed, volume }

/// A domain model representing a specific conversion category.
///
/// It encapsulates all the necessary metadata needed to render
/// category cards, list items, and manage its associated units.
class ConverterCategory {
  /// The unique identifier of the category, used for routing and settings persistence.
  final ConverterGroup id;

  /// The visual representation of the category in the UI.
  final IconData icon;

  /// The localized display name of the category.
  final String label;

  /// The collection of units available for conversion within this category.
  final List<UnitDefinition> units;

  const ConverterCategory({
    required this.id,
    required this.icon,
    required this.label,
    required this.units,
  });
}
