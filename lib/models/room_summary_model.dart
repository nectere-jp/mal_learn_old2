import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mal_learn/extensions/string_to_chat_type.dart';

class RoomSummaryModel {
  RoomSummaryModel.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    name = data['name'] as String?;
    lastMessageAt = (data['lastMessageAt'] as Timestamp?)?.toDate();
    lastMessage = data['lastMessage'] as String?;

    id = doc.id;
    chatType = (data['chatType'] as String?)?.toChatType();

    final src = data['iconPath'] as String?;
    if (src != null) {
      icon = Image.network(src);
    } else {
      icon = Image.asset('assets/images/default_icon.png');
    }
  }

  late final String? name;
  late final Image icon;
  late final DateTime? lastMessageAt;
  late final String? lastMessage;
  late final String? id;
  late final ChatType? chatType;
}

enum ChatType {
  dm,
  group,
}
