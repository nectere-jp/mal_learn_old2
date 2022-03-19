import 'package:flutter/material.dart';

TextFormField textField({
  TextInputType? textInputType,
  required String label,
  bool obscureText = false,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        fontSize: 16,
        color: Colors.teal,
      ),
      contentPadding: const EdgeInsets.only(bottom: 4),
    ),
    keyboardType: textInputType,
    obscureText: obscureText,
  );
}
