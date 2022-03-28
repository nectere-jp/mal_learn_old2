import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/screens/home_screen/chat_list_screen/app_bar.dart';
import 'package:mal_learn/screens/home_screen/chat_list_screen/body.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Body(),
    );
  }
}
