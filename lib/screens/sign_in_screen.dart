import 'package:flutter/material.dart';
import 'package:mal_learn/screens/sign_up_screen.dart';
import 'package:mal_learn/widgets/FormFields/form_items.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
          const Expanded(
            child: Center(
              child: Image(
                image: AssetImage('assets/images/play_time.png'),
              ),
            ),
          ),
          const SizedBox(height: 64),
          const Text(
            'ログイン',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 32),
          const EmailField(),
          const SizedBox(height: 32),
          const PasswordField(),
          const SizedBox(height: 32),
          SubmitButton(
            labelText: 'ログイン',
            onPressed: () {},
          ),
          const SizedBox(height: 32),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<Scaffold>(
                    builder: (context) => const SignUpScreen(),
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
          ),
          const SizedBox(height: 42),
        ],
      ),
    );
  }
}
