import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/message_model.dart';
import 'package:mal_learn/providers/repository_provider.dart';
import 'package:mal_learn/screens/chat_room_screen/text_baloon.dart';

class ChatMessages extends ConsumerWidget {
  const ChatMessages(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.read(repositoryProvider);

    return Expanded(
      child: StreamBuilder(
        stream: repository.fetchMessages(id),
        builder: (context, AsyncSnapshot<List<Message>> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                reverse: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  if (index >= 1 &&
                      data[index - 1].sentBy != data[index].sentBy) {
                    return Column(
                      children: [
                        TextBaloon(data[index]),
                        const SizedBox(height: 20),
                      ],
                    );
                  }
                  return TextBaloon(data[index]);
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
