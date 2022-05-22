import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/functions/generate_id.dart';

class AuthRepository {
  AuthRepository(this.read, this.watch);

  final Reader read;
  final T Function<T>(AlwaysAliveProviderListenable<T>) watch;

  Future<void> signUp({
    required String userName,
    required String email,
    required String password,
    required DateTime birthday,
    required String iconPath,
  }) async {
    await firebase_auth.FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    final uid = firebase_auth.FirebaseAuth.instance.currentUser!.uid;

    final iconEextension = iconPath.split('/').last.split('.').last;
    final task = await FirebaseStorage.instance
        .ref()
        .child('users/$uid')
        .child('icon.$iconEextension')
        .putFile(File(iconPath));

    await FirebaseFirestore.instance.collection('users').doc(uid).set(
      <String, dynamic>{
        'id': generateId(8),
        'userName': userName,
        'birthday': Timestamp.fromDate(birthday),
        'iconUrl': await task.ref.getDownloadURL(),
        'friends': <String>[],
      },
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await firebase_auth.FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
