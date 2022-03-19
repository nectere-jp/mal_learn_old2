import 'package:flutter/material.dart';
import 'package:mal_learn/widgets/FormFields/text_field.dart';

class BirthdayField extends StatelessWidget {
  const BirthdayField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textField(
      label: '生年月日',
    );
  }
}

//TODO: autofill hints
//TODO: validator