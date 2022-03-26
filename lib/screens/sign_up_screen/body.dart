import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/screens/sign_in_screen/submit_button.dart';
import 'package:mal_learn/screens/sign_up_screen/link_to_sign_up_page.dart';
import 'package:mal_learn/widgets/formFields/form_items.dart';

class Body extends ConsumerWidget {
  Body({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  MySubmitButton(_formKey),
                  const SizedBox(height: 16),
                  const LinkToSignInPage(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
