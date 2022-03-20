import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/user_provider.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider).asData?.value;
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('uid'),
            subtitle: Text(userModel?.user.uid ?? 'no user'),
          ),
          ListTile(
            title: const Text('birthday'),
            subtitle: Text(userModel?.birthday.toString() ?? 'no birthday'),
          ),
          ListTile(
            title: const Text('user name'),
            subtitle: Text(userModel?.userName ?? 'no user name'),
          ),
          // ref.watch(userModelProvider)?.icon ?? const Text('Nothing'),
        ],
      ),
    );
  }
}
