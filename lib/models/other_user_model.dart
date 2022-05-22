import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OtherUser {
  OtherUser.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();

    userName = data['userName'] as String? ?? '';
    id = data['id'] as String? ?? '';

    if (data['iconUrl'] != null) {
      iconProvider = NetworkImage(data['iconUrl'] as String);
    } else {
      iconProvider = const AssetImage('assets/images/default_icon.png');
    }

    final backgroundUrl = data['backgroundUrl'] as String?;
    if (backgroundUrl != null) {
      backgroundProvider = NetworkImage(backgroundUrl);
    } else {
      backgroundProvider =
          const AssetImage('assets/images/default_background.jpeg');
    }

    uid = doc.reference.id;
  }

  late String userName;
  late final String uid;
  late String id;
  late ImageProvider iconProvider;
  late ImageProvider backgroundProvider;
}
