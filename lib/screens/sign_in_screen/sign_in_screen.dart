import 'package:flutter/material.dart';
import 'package:mal_learn/screens/sign_in_screen/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: Body()),
    );
  }
}
