import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/other_user_model.dart';
import 'package:mal_learn/providers/user_provider.dart';
import 'package:mal_learn/repositories/user_repository.dart';

class SearchRepository {
  SearchRepository(this.read, this.watch, this.userRepository);

  final Reader read;
  final T Function<T>(AlwaysAliveProviderListenable<T>) watch;
  final UserRepository userRepository;

  Future<Stream<List<OtherUser>>> searchUserById(String id) async {
    final transformer = StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
        List<OtherUser>>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value.docs.map(OtherUser.fromDoc).toList());
      },
    );

    final uid = read(uidProvider)!;
    final currentUserId = await userRepository.fetchUserId(uid);

    return FirebaseFirestore.instance
        .collection('users')
        .where('id', isNotEqualTo: currentUserId)
        .orderBy('id')
        .startAt([id])
        .endAt(['id\uf8ff'])
        .snapshots()
        .transform(transformer);
  }
}
