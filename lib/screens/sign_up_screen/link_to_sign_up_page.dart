import 'package:flutter/material.dart';
import 'package:mal_learn/screens/sign_in_screen/sign_in_screen.dart';

class LinkToSignInPage extends StatelessWidget {
  const LinkToSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<Scaffold>(
              builder: (context) => const SignInScreen(),
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
}
