import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';
import 'package:mal_learn/providers/repository_provider.dart';
import 'package:mal_learn/screens/chat_list_screen/body.dart';
import 'package:mal_learn/screens/chat_list_screen/chat_list_screen.dart';
import 'package:mal_learn/screens/sign_in_screen/sign_in_screen.dart';
import 'package:mal_learn/widgets/FormFields/form_items.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(child: Body()),
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

  
}
