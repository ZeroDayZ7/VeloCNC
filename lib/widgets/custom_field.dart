import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String label;
  final String suffix;
  final TextEditingController? controller;
  final String? initialValue;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  const CustomField({
    super.key,
    required this.label,
    required this.suffix,
    this.controller,
    this.initialValue,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
