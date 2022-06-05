import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/message_model.dart';
import 'package:mal_learn/providers/user_provider.dart';

class TextBaloon extends ConsumerWidget {
  const TextBaloon(this.message, {Key? key}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.read(userProvider).value!.uid;
    final isSender = message.sentBy == uid;

    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Container(
              decoration: BoxDecoration(
                color: isSender ? Colors.grey[200] : Colors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                message.text,
                style: TextStyle(
                  color: isSender ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
