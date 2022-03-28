import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserModel(this.user);

  final User user;
  String? userName;
  String? id;
  DateTime? birthday;
  String? iconPath;

  Future<void> fetchUserInfo() async {
    final document = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    final data = document.data();

    userName = data?['userName'] as String?;
    birthday = (data?['birthday'] as Timestamp?)?.toDate();
    iconPath = data?['iconPath'] as String?;
  }
}
