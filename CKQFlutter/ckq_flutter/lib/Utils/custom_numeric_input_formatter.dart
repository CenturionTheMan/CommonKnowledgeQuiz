import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNumericInputFormatter extends TextInputFormatter {
  CustomNumericInputFormatter({this.maxValue, required this.minValue});

  final int? maxValue;
  final int minValue;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return TextEditingValue(text: minValue.toString());
    }

    int? number = int.tryParse(newValue.text);
    if (number == null) {
      return oldValue;
    }

    if (maxValue != null && number > maxValue!) {
      return TextEditingValue(text: maxValue.toString());
    }

    if (number < minValue) {
      return TextEditingValue(text: minValue.toString());
    }

    return TextEditingValue(text: number.toString());
  }
}
