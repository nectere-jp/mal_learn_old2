import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/screens/sign_up_screen/link_to_sign_up_page.dart';
import 'package:mal_learn/screens/sign_up_screen/submit_button.dart';
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
                child: _FormContent(
                  formKey: _formKey,
                  maxHeight: constraints.maxHeight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormContent extends ConsumerWidget {
  const _FormContent({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.maxHeight,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double maxHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RepaintBoundary(
      key: key,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: maxHeight,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(height: 32),
              const Text(
                'アカウントを作成',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const Text('これらの情報は、設定>情報からいつでも編集できます。'),
              const SizedBox(height: 24),
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
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
