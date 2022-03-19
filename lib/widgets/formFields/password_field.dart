import 'package:flutter/material.dart';
import 'package:mal_learn/widgets/FormFields/text_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textField(
      label: 'パスワード',
      obscureText: true,
    );
  }
}

//TODO: autofill hints
//TODO: validator