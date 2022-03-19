import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.labelText,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: Colors.deepOrange.shade700,
        shape: const StadiumBorder(),
        height: 40,
        onPressed: onPressed,
        child: Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
