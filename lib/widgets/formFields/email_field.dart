import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';

class EmailField extends ConsumerWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'メールアドレス',
        labelStyle: TextStyle(
          fontSize: 16,
          color: Colors.teal,
        ),
        contentPadding: EdgeInsets.only(bottom: 4),
      ),
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: emailValidator,
      onSaved: (value) {
        ref.read(emailProvider.notifier).state = value;
      },
    );
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    } else if (EmailValidator.validate(value) != true) {
      return '正しいメールアドレスを入力してください';
    } else {
      return null;
    }
  }
}
