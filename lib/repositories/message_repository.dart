import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/message_model.dart';

class MessageRepository {
  MessageRepository(this.read, this.watch);

  final Reader read;
  final T Function<T>(AlwaysAliveProviderListenable<T>) watch;

  Stream<List<Message>> fetchMessages(String id) {
    final transformer = StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
        List<Message>>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value.docs.map(Message.fromDoc).toList());
      },
    );

    return FirebaseFirestore.instance
        .collection('rooms')
        .doc(id)
        .collection('messages')
        // .orderBy('time', descending: true)
        .snapshots()
        .transform(transformer);
  }
}
