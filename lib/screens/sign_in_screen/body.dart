import 'package:flutter/material.dart';
import 'package:mal_learn/screens/sign_in_screen/link_to_sign_up_page.dart';
import 'package:mal_learn/screens/sign_in_screen/submit_button.dart';
import 'package:mal_learn/widgets/formFields/form_items.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
              MySubmitButton(_formKey),
              const SizedBox(height: 16),
              const LinkToSignUpPage(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
