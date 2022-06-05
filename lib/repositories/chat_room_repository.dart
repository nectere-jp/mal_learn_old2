import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/user_provider.dart';

class ChatRoomRepository {
  ChatRoomRepository(this.read, this.watch);

  final Reader read;
  final T Function<T>(AlwaysAliveProviderListenable<T>) watch;

  void sendMessage(String id, String text) {
    final uid = read(userProvider).value!.uid;

    FirebaseFirestore.instance
        .collection('rooms')
        .doc(id)
        .collection('messages')
        .add(<String, dynamic>{
      'text': text,
      'sentAt': Timestamp.fromDate(DateTime.now()),
      'sentBy': uid,
    });
  }
}
