import 'package:flutter/material.dart';
import 'package:mal_learn/widgets/formFields/text_field.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textField(
      label: 'ユーザー名',
    );
  }
}

//TODO: autofill hints
//TODO: validator