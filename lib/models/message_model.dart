// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class Message {
  Message({
    required this.sentBy,
    required this.sentAt,
    required this.text,
  });

  Message.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();

    sentAt = (data['sentAt'] as Timestamp).toDate();
    sentBy = data['sentBy'] as String;
    text = data['text'] as String;

    id = doc.reference.id;
  }

  late final String id;
  late final String sentBy;
  late final DateTime sentAt;
  late final String text;

  types.TextMessage toChatUiMessage() {
    return types.TextMessage(
      id: id,
      author: types.User(id: sentBy, firstName: sentBy),
      text: text,
    );
  }
}
