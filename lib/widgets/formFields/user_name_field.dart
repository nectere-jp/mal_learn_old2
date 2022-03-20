import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';

class UserNameField extends ConsumerWidget {
  const UserNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'ユーザー名',
        labelStyle: TextStyle(
          fontSize: 16,
          color: Colors.teal,
        ),
        contentPadding: EdgeInsets.only(bottom: 4),
      ),
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: userNameValidator,
      onChanged: (value) {
        ref.read(userNameProvider.notifier).state = value;
      },
    );
  }

  String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ユーザー名を入力してください';
    } else if (value.length > 30) {
      return '30文字以下で入力してください';
    } else {
      return null;
    }
  }
}
