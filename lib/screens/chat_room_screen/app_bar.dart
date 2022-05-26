import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Hello'),
      elevation: 0,
      backgroundColor: Theme.of(context).canvasColor,
      centerTitle: false,
      leadingWidth: 75,
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
