import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/room_summary_model.dart';
import 'package:mal_learn/providers/repository_provider.dart';
import 'package:mal_learn/providers/user_provider.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar(),
      body: body(ref),
    );
  }

  AppBar appBar() {
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
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: SizedBox(
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
          ),
        ),
      ],
    );
  }

  Widget body(WidgetRef ref) {
    final repository = ref.read(repositoryProvider);
    final userModel = ref.watch(userModelProvider).value;

    if (userModel == null) {
      return const Center(child: Text('エラーが発生しました。アプリを再起動してください'));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: serchField(),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: StreamBuilder(
            stream: repository.getRoomList(userModel),
            builder: (context, AsyncSnapshot<List<RoomSummaryModel>> snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return chatListTile(data[index]);
                  },
                );
              } else {
                return const Center(child: Text('Loading'));
              }
            },
          ),
        ),
      ],
    );
  }

  Widget chatListTile(RoomSummaryModel room) {
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
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
    );
  }

  Widget serchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 35,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            hintText: '検索',
            contentPadding: const EdgeInsets.symmetric(vertical: 2),
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
