import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:mal_learn/widgets/equation_text.dart';

class ChatTextSpanBuilder extends SpecialTextSpanBuilder {
  ChatTextSpanBuilder(this.context, this.controller);

  final BuildContext context;
  final TextEditingController controller;

  @override
  SpecialText? createSpecialText(
    String flag, {
    required int index,
    void Function(dynamic)? onTap,
    TextStyle? textStyle,
  }) {
    if (flag != '' && isStart(flag, EquationText.firstFlag)) {
      return EquationText(textStyle ?? const TextStyle());
    }

    return null;
  }
}
