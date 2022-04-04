import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

class UserModel {
  UserModel(this.user);

  final User user;
  String? userName;
  String? id;
  DateTime? birthday;
  ImageProvider? iconProvider;

  Future<void> fetchUserInfo() async {
    final document = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    final data = document.data();

    userName = data?['userName'] as String?;
    birthday = (data?['birthday'] as Timestamp?)?.toDate();
    if (data?['iconPath'] != null) {
      iconProvider = NetworkImage(data?['iconPath'] as String);
    } else {
      iconProvider = const AssetImage('assets/images/default_icon.png');
    }
    id = data?['id'] as String?;
  }
}
