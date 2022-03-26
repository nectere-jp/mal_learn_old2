import 'package:flutter/material.dart';
import 'package:mal_learn/screens/sign_up_screen/sign_up_screen.dart';

class LinkToSignUpPage extends StatelessWidget {
  const LinkToSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
