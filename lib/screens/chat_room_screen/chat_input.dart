import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/repository_provider.dart';

class ChatInput extends ConsumerStatefulWidget {
  const ChatInput(this.roomId, {Key? key}) : super(key: key);

  final String roomId;

  @override
  ConsumerState<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends ConsumerState<ChatInput> {
  String enteredText = '';
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final repository = ref.read(repositoryProvider);

    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).canvasColor),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 30,
          left: 20,
          right: 20,
        ),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.teal[50],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        enteredText = value;
                      });
                    },
                    controller: controller,
                  ),
                ),
                (enteredText.isNotEmpty)
                    ? IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            repository.sendMessage(
                              widget.roomId,
                              controller.text,
                            );
                          }
                          setState(() {
                            enteredText = '';
                          });
                          controller.text = '';
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
