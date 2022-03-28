import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          'チャット',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      backgroundColor: Colors.white10,
      elevation: 0,
      centerTitle: false,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 30),
          child: _CreateRoomButton(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(),
          side: const BorderSide(
            color: Colors.deepOrange,
            width: 2,
          ),
          padding: EdgeInsets.zero,
        ),
        child: const Icon(Icons.add, color: Colors.deepOrange),
      ),
    );
  }
}
