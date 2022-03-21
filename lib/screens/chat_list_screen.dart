import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
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

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          serchField(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return chatListTile();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget chatListTile() {
    return ListTile(
      title: const Text(
        'チャット名',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: const Text('養田まじでクビにしたい'),
      leading: ClipOval(
        child: Image.network(
          'https://newsatcl-pctr.c.yimg.jp/r/iwiz-amd/20220308-00000020-sasahi-000-1-view.jpg?pri=l&w=625&h=640&exp=10800',
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Text(
          '9:30',
          style: TextStyle(color: Colors.teal.shade300),
        ),
      ),
      onTap: () {},
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
