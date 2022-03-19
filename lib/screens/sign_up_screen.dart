import 'package:flutter/material.dart';
import 'package:mal_learn/widgets/FormFields/form_items.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget body(BuildContext context) {
    return Padding(
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
          const Expanded(child: SizedBox(height: 32)),
          const IconPicker(),
          const SizedBox(height: 16),
          const UserNameField(),
          const SizedBox(height: 32),
          const EmailField(),
          const SizedBox(height: 32),
          const PasswordField(),
          const SizedBox(height: 32),
          const BirthdayField(),
          const SizedBox(height: 16),
          const TermsCheckbox(),
          const Expanded(child: SizedBox(height: 16)),
          SubmitButton(
            labelText: 'アカウントを作成',
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'すでにアカウントをお持ちの場合はこちら',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(height: 42),
        ],
      ),
    );
  }
}
