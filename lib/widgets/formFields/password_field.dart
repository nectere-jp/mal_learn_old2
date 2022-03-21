import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'パスワード',
        labelStyle: TextStyle(
          fontSize: 16,
          color: Colors.teal,
        ),
        contentPadding: EdgeInsets.only(bottom: 4),
      ),
      obscureText: true,
      autofillHints: const [AutofillHints.password],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: passwordValidator,
      onChanged: (value) {
        ref.read(passwordProvider.notifier).state = value;
      },
    );
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    } else if (value.length < 6) {
      return '6文字以上入力してください';
    } else {
      return null;
    }
  }
}
