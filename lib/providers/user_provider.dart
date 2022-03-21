import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/user_model.dart';

final authUserProvider = StreamProvider((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final userModelProvider = FutureProvider<UserModel?>((ref) async {
  final user = ref.watch(authUserProvider).asData?.value;
  if (user == null) {
    return null;
  }

  final userModel = UserModel(user);
  await userModel.fetchUserInfo();
  return userModel;
});
