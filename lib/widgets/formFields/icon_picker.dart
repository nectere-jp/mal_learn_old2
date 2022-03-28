import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';

class IconPicker extends FormField<String> {
  IconPicker({
    Key? key,
    required WidgetRef ref,
    required BuildContext context,
  }) : super(
          key: key,
          builder: _IconPickerFunctions(
            ref: ref,
            context: context,
          ).builder,
          initialValue: ref.read(iconPathProvider),
          validator: _IconPickerFunctions.birthdayValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
}

class _IconPickerFunctions {
  _IconPickerFunctions({required this.ref, required this.context});

  final WidgetRef ref;
  final BuildContext context;

  Widget builder(FormFieldState<String> state) {
    final iconPath = ref.watch(iconPathProvider);

    return Column(
      children: [
        _IconButton(
          onPressed: () {
            selectImage(state);
          },
          image: AssetImage(iconPath ?? 'assets/images/default_icon.png'),
        ),
        Text(
          state.errorText ?? '',
          style: TextStyle(color: Theme.of(context).errorColor),
        ),
      ],
    );
  }

  Future<void> selectImage(FormFieldState<String> state) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      final path = result.files.single.path!;

      state.didChange(path);
      ref.read(iconPathProvider.notifier).state = path;
    }
  }

  static String? birthdayValidator(String? value) {
    if (value == null) {
      return 'アイコンを選択してください';
    } else {
      return null;
    }
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.onPressed,
    required this.image,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(
                  color: Colors.grey,
                ),
                padding: EdgeInsets.zero,
              ),
              onPressed: onPressed,
              child: ClipOval(
                child: Image(
                  width: 95,
                  height: 95,
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepOrange,
                border: Border.all(color: Colors.white),
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
