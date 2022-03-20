import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel {
  UserModel(this.user) {
    fetchUserInfo();
  }

  final User user;
  late final String? userName;
  late final DateTime? birthday;
  late final Image? icon;

  Future<void> fetchUserInfo() async {
    final document = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    userName = document['displayName'] as String?;
    birthday = (document['birthday'] as Timestamp?)?.toDate();

    final src = document['iconPath'] as String?;
    if (src != null) {
      icon = Image.network(src);
    }
  }
}
