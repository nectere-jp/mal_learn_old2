import 'package:flutter/material.dart';

class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 30,
          width: 30,
          child: Checkbox(
            value: true,
            onChanged: (newValue) {},
            
          ),
        ),
        const Text('利用規約に同意します。'),
      ],
    );
  }
}
