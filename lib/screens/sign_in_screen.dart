import 'package:flutter/material.dart';
import 'package:mal_learn/screens/sign_up_screen.dart';
import 'package:mal_learn/widgets/FormFields/form_items.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(child: body(context)),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget body(BuildContext context) {
    return Form(
      key: _formKey,
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
            submitButton(context),
            const SizedBox(height: 16),
            linkToSignUpPage(context),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return SubmitButton(
      labelText: 'ログイン',
      onPressed: () => onSignIn(context),
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

  void onSignIn(BuildContext context) {
    try {
      if (_formKey.currentState?.validate() != true) {
        return;
      }
    } on Exception catch (e) {
      showDialog<AlertDialog>(
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
