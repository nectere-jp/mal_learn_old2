import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel {
  UserModel(this.user);

  final User user;
  String? userName;
  DateTime? birthday;
  Image? icon;

  Future<void> fetchUserInfo() async {
    final document = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    final data = document.data();

    userName = data?['userName'] as String?;
    birthday = (data?['birthday'] as Timestamp?)?.toDate();

    final src = data?['iconPath'] as String?;
    if (src != null) {
      icon = Image.network(src);
    } else {
      icon = Image.asset('assets/images/default_icon.png');
    }
  }
}
