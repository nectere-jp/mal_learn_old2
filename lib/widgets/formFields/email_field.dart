import 'package:flutter/material.dart';
import 'package:mal_learn/widgets/FormFields/text_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textField(
      label: 'メールアドレス',
      textInputType: TextInputType.emailAddress,
    );
  }
}

//TODO: autofill hints
//TODO: validator