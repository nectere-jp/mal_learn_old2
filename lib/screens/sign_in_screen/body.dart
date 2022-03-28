import 'package:flutter/material.dart';
import 'package:mal_learn/screens/sign_in_screen/link_to_sign_up_page.dart';
import 'package:mal_learn/screens/sign_in_screen/submit_button.dart';
import 'package:mal_learn/widgets/formFields/form_items.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(
            left: 32,
            right: 32,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: AutofillGroup(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  height: constraints.maxHeight,
                ),
                child: _FormContent(formKey: _formKey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormContent extends StatelessWidget {
  const _FormContent({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 32),
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
        const SizedBox(height: 12),
      ],
    );
  }
}
