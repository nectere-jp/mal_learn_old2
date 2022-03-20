import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';

class BirthdayField extends FormField<DateTime> {
  BirthdayField({
    Key? key,
    required BuildContext context,
    required WidgetRef ref,
  }) : super(
          key: key,
          builder: _BirthdayFieldFunctions(context: context, ref: ref).builder,
          validator: _BirthdayFieldFunctions.birthdayValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
}

class _BirthdayFieldFunctions {
  _BirthdayFieldFunctions({
    required this.context,
    required this.ref,
  });

  final BuildContext context;
  final WidgetRef ref;

  final _controller = TextEditingController();

  Widget builder(FormFieldState<DateTime> state) {
    return Focus(
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: '生年月日',
          labelStyle: const TextStyle(
            fontSize: 16,
            color: Colors.teal,
          ),
          contentPadding: const EdgeInsets.only(bottom: 4),
          errorText: state.errorText,
        ),
        readOnly: true,
      ),
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          selectDate(state);
        }
      },
    );
  }

  Future<void> selectDate(
    FormFieldState<DateTime> state,
  ) async {
    DateTime? birthday;

    await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(DateTime.now().year - 120),
      maxTime: DateTime.now(),
      onConfirm: (date) {
        birthday = date;
      },
      onCancel: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      currentTime: DateTime(DateTime.now().year - 16),
      locale: LocaleType.jp,
    );

    if (birthday != null) {
      state.didChange(birthday);
      ref.read(birthdayProvider.notifier).state = birthday;
      _controller.value = _controller.value.copyWith(
        text: '${birthday!.year}年${birthday!.month}月${birthday!.day}日',
      );

      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static String? birthdayValidator(DateTime? value) {
    if (value == null) {
      return '生年月日を入力してください';
    } else {
      return null;
    }
  }
}
