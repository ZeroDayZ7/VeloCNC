import 'package:flutter/material.dart';

const _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(),
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,
  inputDecorationTheme: _inputDecorationTheme,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  inputDecorationTheme: _inputDecorationTheme,
);
