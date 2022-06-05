import 'package:flutter/material.dart';
import 'package:mal_learn/screens/chat_room_screen/app_bar.dart';
import 'package:mal_learn/screens/chat_room_screen/chat_input.dart';
import 'package:mal_learn/screens/chat_room_screen/chat_messages.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Body(id),
    );
  }
}

class Body extends StatelessWidget {
  const Body(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatMessages(id),
        ChatInput(id),
      ],
    );
  }
}
