// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat_ui;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/message_model.dart';
import 'package:mal_learn/providers/repository_provider.dart';
import 'package:mal_learn/providers/user_provider.dart';
import 'package:mal_learn/screens/chat_room_screen/app_bar.dart';

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

class Body extends ConsumerWidget {
  const Body(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.read(repositoryProvider);

    return StreamBuilder(
      stream: repository.fetchMessages(id),
      builder: (context, AsyncSnapshot<List<Message>> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Text('メッセージがありません!');
          }

          final user = ref.read(userProvider).value!;
          final chatUiUser = types.User(id: user.uid, firstName: user.userName);

          final messages = data.map((i) => i.toChatUiMessage()).toList();

          return chat_ui.Chat(
            messages: messages,
            user: chatUiUser,
            onSendPressed: (_) {},
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
