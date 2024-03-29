import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      final String formattedValue =
          NumberFormat.decimalPattern().format(int.parse(newValue.text));
      return TextEditingValue(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: formattedValue.length),
      );
    }
    return newValue;
  }
}

class ZeroPrefixInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    if (newText.length >= 3) {
      if (newText.substring(0, 3) == '000') {
        newText = '0' + newText.substring(3);
      }
    }
    return TextEditingValue(
      text: newText,
      selection: newValue.selection,
    );
  }
}

