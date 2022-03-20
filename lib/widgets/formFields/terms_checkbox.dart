import 'package:flutter/material.dart';

class TermsCheckbox extends FormField<bool> {
  TermsCheckbox({
    Key? key,
    required BuildContext context,
  }) : super(
          key: key,
          builder: _TermsCheckboxFunctions(
            context: context,
          ).builder,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: _TermsCheckboxFunctions.termValidator,
        );
}

class _TermsCheckboxFunctions {
  _TermsCheckboxFunctions({required this.context});

  final BuildContext context;

  Widget builder(FormFieldState<bool> state) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
              width: 30,
              child: Checkbox(
                value: state.value ?? false,
                onChanged: (newValue) {
                  state.didChange(newValue);
                },
              ),
            ),
            const Text('利用規約に同意します'),
          ],
        ),
        Text(
          state.errorText ?? '',
          style: TextStyle(color: Theme.of(context).errorColor),
        )
      ],
    );
  }

  // ignore: avoid_positional_boolean_parameters
  static String? termValidator(bool? value) {
    if (value != true) {
      return '利用規約に同意してください';
    } else {
      return null;
    }
  }
}
