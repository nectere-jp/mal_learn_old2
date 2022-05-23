import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/user_model.dart';

final authUserProvider = StreamProvider((ref) {
  return firebase_auth.FirebaseAuth.instance.authStateChanges();
});

final userProvider = FutureProvider<User?>((ref) async {
  final authUser = ref.watch(authUserProvider).value;
  if (authUser == null) {
    return null;
  }
  final document = await FirebaseFirestore.instance
      .collection('users')
      .doc(authUser.uid)
      .get();

  return User.fromDoc(document);
});
