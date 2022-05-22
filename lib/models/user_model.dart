import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/rendering.dart';

class User {
  User(this.user);

  final firebase_auth.User user;
  late final String uid;
  late final String userName;
  late final String id;
  late final DateTime? birthday;
  late final ImageProvider iconProvider;
  late final ImageProvider backgroundProvider;

  Future<void> fetchUserInfo() async {
    final document = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    final data = document.data();

    userName = (data?['userName'] as String?) ?? '[ユーザー名未設定]';

    birthday = (data?['birthday'] as Timestamp?)?.toDate();

    if (data?['iconPath'] != null) {
      iconProvider = NetworkImage(data?['iconPath'] as String);
    } else {
      iconProvider = const AssetImage('assets/images/default_icon.png');
    }

    if (data?['backgroundPath'] != null) {
      backgroundProvider = NetworkImage(data?['backgroundPath'] as String);
    } else {
      backgroundProvider =
          const AssetImage('assets/images/default_background.jpeg');
    }

    id = data?['id'] as String;

    uid = user.uid;
  }
}
