import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart' show ImageProvider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/repository_provider.dart';

final authUserProvider = StreamProvider((ref) {
  return firebase_auth.FirebaseAuth.instance.authStateChanges();
});

final uidProvider = Provider<String?>((ref) {
  final authUser = ref.watch(authUserProvider).asData?.value;
  return authUser?.uid;
});

final iconProvider = FutureProvider<ImageProvider>((ref) {
  final repository = ref.read(repositoryProvider);
  final uid = ref.watch(uidProvider);
  return repository.fetchUserIcon(uid!);
});

final backgroundImageProvider = FutureProvider<ImageProvider>((ref) {
  final repository = ref.read(repositoryProvider);
  final uid = ref.watch(uidProvider);
  return repository.fetchUserBackgroundImage(uid!);
});

final userIdProvider = FutureProvider<String>((ref) {
  final repository = ref.read(repositoryProvider);
  final uid = ref.watch(uidProvider);
  return repository.fetchUserId(uid!);
});

final userNameProvider = FutureProvider<String>((ref) {
  final repository = ref.read(repositoryProvider);
  final uid = ref.watch(uidProvider);
  return repository.fetchUserName(uid!);
});
