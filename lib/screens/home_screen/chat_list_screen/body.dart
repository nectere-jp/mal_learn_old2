import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/room_summary_model.dart';
import 'package:mal_learn/providers/repository_provider.dart';
import 'package:mal_learn/providers/user_provider.dart';
import 'package:mal_learn/screens/home_screen/chat_list_screen/chat_list_tile.dart';
import 'package:mal_learn/screens/home_screen/chat_list_screen/search_field.dart';

class Body extends ConsumerWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.read(repositoryProvider);
    final userModel = ref.watch(userModelProvider).value;

    if (userModel == null) {
      return const Center(child: Text('エラーが発生しました。アプリを再起動してください'));
    }

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SearchField(),
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
                    return ChatListTile(data[index]);
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
}
