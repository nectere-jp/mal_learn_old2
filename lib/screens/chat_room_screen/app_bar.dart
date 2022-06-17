import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar(this.name, {Key? key}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(name),
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
