import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/rendering.dart';

class User {
  User.fromDoc(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    user = firebase_auth.FirebaseAuth.instance.currentUser!;
    uid = document.reference.id;
    userName = data['userName'] as String;
    id = data['id'] as String;
    birthday = (data['birthday'] as Timestamp).toDate();

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
  }

  late final firebase_auth.User user;
  late final String uid;
  late final String userName;
  late final String id;
  late final DateTime birthday;
  late final ImageProvider iconProvider;
  late final ImageProvider backgroundProvider;
}
