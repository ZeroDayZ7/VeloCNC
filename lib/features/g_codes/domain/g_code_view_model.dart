import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class GCodeViewModel extends Equatable {
  final String code;
  final String title;
  final String description;
  final String example;

  const GCodeViewModel({
    required this.code,
    required this.title,
    required this.description,
    required this.example,
  });

  @override
  List<Object?> get props => [code, title, description, example];
}
