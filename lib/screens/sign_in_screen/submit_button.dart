import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';
import 'package:mal_learn/providers/repository_provider.dart';
import 'package:mal_learn/screens/home_screen/home_screen/home_screen.dart';
import 'package:mal_learn/widgets/formFields/form_items.dart';

class MySubmitButton extends ConsumerWidget {
  const MySubmitButton(this._formKey, {Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubmitButton(
      labelText: 'ログイン',
      onPressed: () => onSignIn(context, ref),
    );
  }

  Future<void> onSignIn(BuildContext context, WidgetRef ref) async {
    final repository = ref.read(repositoryProvider);

    try {
      if (_formKey.currentState?.validate() != true) {
        return;
      }

      final email = ref.read(emailProvider)!;
      final password = ref.read(passwordProvider)!;

      await repository.signIn(email: email, password: password);

      TextInput.finishAutofillContext();

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
