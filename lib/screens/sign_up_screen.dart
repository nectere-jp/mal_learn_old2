import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';
import 'package:mal_learn/repositories/repository.dart';
import 'package:mal_learn/screens/chat_list_screen.dart';
import 'package:mal_learn/screens/sign_in_screen.dart';
import 'package:mal_learn/widgets/FormFields/form_items.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'アカウントを作成',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Text('これらの情報は、設定>情報からいつでも編集できます。'),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  IconPicker(context: context, ref: ref),
                  const SizedBox(height: 16),
                  const UserNameField(),
                  const SizedBox(height: 24),
                  const EmailField(),
                  const SizedBox(height: 24),
                  const PasswordField(),
                  const SizedBox(height: 24),
                  BirthdayField(context: context, ref: ref),
                  const SizedBox(height: 24),
                  TermsCheckbox(context: context),
                  const SizedBox(height: 24),
                  submitButton(context, ref),
                  const SizedBox(height: 16),
                  linkToSignInPage(context),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget submitButton(BuildContext context, WidgetRef ref) {
    return SubmitButton(
      labelText: 'アカウントを作成',
      onPressed: () => onSignUp(context, ref),
    );
  }

  Widget linkToSignInPage(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<Scaffold>(
              builder: (context) => SignInScreen(),
            ),
          );
        },
        child: const Text(
          'アカウントをお持ちの方はこちら',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Future<void> onSignUp(BuildContext context, WidgetRef ref) async {
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
