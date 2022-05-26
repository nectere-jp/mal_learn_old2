import 'package:flutter/material.dart';
import 'package:mal_learn/models/chat_room_model.dart';
import 'package:mal_learn/screens/chat_room_screen/chat_room_screen.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile(this.room, {Key? key}) : super(key: key);

  final ChatRoom room;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        room.name ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: room.lastMessage != null ? Text(room.lastMessage!) : null,
      leading: ClipOval(
        child: room.icon,
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Text(
          '9:30',
          style: TextStyle(color: Colors.teal.shade300),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<Scaffold>(
            builder: (context) => ChatRoomScreen(room.id),
          ),
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
    );
  }
}
