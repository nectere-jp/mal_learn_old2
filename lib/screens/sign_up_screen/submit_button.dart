import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';
import 'package:mal_learn/providers/repository_provider.dart';
import 'package:mal_learn/screens/home_screen/home_screen/home_screen.dart';
import 'package:mal_learn/widgets/formFields/submit_button.dart';

class MySubmitButton extends ConsumerWidget {
  const MySubmitButton(this._formKey, {Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubmitButton(
      labelText: 'アカウントを作成',
      onPressed: () => onSignUp(context, ref),
    );
  }

  Future<void> onSignUp(BuildContext context, WidgetRef ref) async {
    final repository = ref.read(repositoryProvider);

    try {
      if (_formKey.currentState?.validate() != true) {
        return;
      }

      final userName = ref.read(userNameProvider)!;
      final email = ref.read(emailProvider)!;
      final password = ref.read(passwordProvider)!;
      final birthday = ref.read(birthdayProvider)!;
      final iconPath = ref.read(iconPathProvider)!;

      await repository.signUp(
        userName: userName,
        email: email,
        password: password,
        birthday: birthday,
        iconPath: iconPath,
      );

      await Navigator.of(context).pushReplacement(
        MaterialPageRoute<HomeScreen>(
          builder: (_) => const HomeScreen(),
        ),
      );
    } on Exception catch (e) {
      await showDialog<AlertDialog>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('エラー'),
            content: Text(e.toString()),
          );
        },
      );
    }
  }
}
