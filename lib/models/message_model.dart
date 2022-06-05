import 'package:cloud_firestore/cloud_firestore.dart';

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
}
