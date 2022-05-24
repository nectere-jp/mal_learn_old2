import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/other_user_model.dart';
import 'package:mal_learn/providers/form_data_providers.dart';
import 'package:mal_learn/providers/user_provider.dart';

final searchResultStreamProvider = StreamProvider((ref) {
  final id = ref.watch(searchIdProvider);

  final transformer = StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
      List<OtherUser>>.fromHandlers(
    handleData: (value, sink) {
      sink.add(value.docs.map(OtherUser.fromDoc).toList());
    },
  );

  final currentUserId = ref.read(userProvider).value!.id;

  return FirebaseFirestore.instance
      .collection('users')
      .where('id', isNotEqualTo: currentUserId)
      .orderBy('id')
      .startAt([id])
      .endAt(['id\uf8ff'])
      .snapshots()
      .transform(transformer);
});
