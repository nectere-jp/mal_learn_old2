import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';
import 'package:mal_learn/providers/repository_provider.dart';
import 'package:mal_learn/screens/chat_list_screen.dart';
import 'package:mal_learn/screens/sign_up_screen.dart';
import 'package:mal_learn/widgets/FormFields/form_items.dart';

class SignInScreen extends ConsumerWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(child: body(context, ref)),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget body(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: AutofillGroup(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Expanded(
                child: Center(
                  child: Image(
                    image: AssetImage('assets/images/play_time.png'),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'ログイン',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 24),
              const EmailField(),
              const SizedBox(height: 24),
              const PasswordField(),
              const SizedBox(height: 24),
              submitButton(context, ref),
              const SizedBox(height: 16),
              linkToSignUpPage(context),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget submitButton(BuildContext context, WidgetRef ref) {
    return SubmitButton(
      labelText: 'ログイン',
      onPressed: () => onSignIn(context, ref),
    );
  }

  Widget linkToSignUpPage(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<Scaffold>(
              builder: (context) => SignUpScreen(),
            ),
          );
        },
        child: const Text(
          'アカウントをお持ちでない方はこちら',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.black,
          ),
        ),
      ),
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
        MaterialPageRoute<ChatListScreen>(
          builder: (_) => const ChatListScreen(),
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
