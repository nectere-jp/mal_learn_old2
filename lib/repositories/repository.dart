import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Repository {
  Repository(this.read);

  final Reader read;

  Future<void> signUp({
    required String userName,
    required String email,
    required String password,
    required DateTime birthday,
    required String iconPath,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    final uid = FirebaseAuth.instance.currentUser!.uid;

    final iconNamEextension = iconPath.split('/').last.split('.').last;
    final task = await FirebaseStorage.instance
        .ref()
        .child('users/$uid')
        .child('icon.$iconNamEextension')
        .putFile(File(iconPath));

    await FirebaseFirestore.instance.collection('users').doc(uid).set(
      <String, dynamic>{
        'userName': userName,
        'birthday': Timestamp.fromDate(birthday),
        'iconPath': await task.ref.getDownloadURL(),
      },
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
