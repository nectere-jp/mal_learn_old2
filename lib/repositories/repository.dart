import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/functions/generate_id.dart';
import 'package:mal_learn/models/other_user_model.dart';
import 'package:mal_learn/models/room_summary_model.dart';
import 'package:mal_learn/models/user_model.dart';
import 'package:mal_learn/providers/user_provider.dart';

class Repository {
  Repository(this.read, this.watch);

  final Reader read;
  final T Function<T>(AlwaysAliveProviderListenable<T>) watch;

  final streamTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>, List<RoomSummaryModel>>.fromHandlers(
    handleData: (value, sink) {
      sink.add(value.docs.map(RoomSummaryModel.fromDoc).toList());
    },
  );

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
        'id': generateId(8),
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

  Stream<List<RoomSummaryModel>> getRoomList(UserModel userModel) {
    final uid = userModel.user.uid;

    final streamTransformer = StreamTransformer<
        QuerySnapshot<Map<String, dynamic>>,
        List<RoomSummaryModel>>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value.docs.map(RoomSummaryModel.fromDoc).toList());
      },
    );

    return FirebaseFirestore.instance
        .collection('rooms')
        .where('members', arrayContains: uid)
        // .orderBy('lastMessageAt')
        .snapshots()
        .transform(streamTransformer);
  }

  Stream<List<OtherUserModel>> getUserListWithId(String? id) {
    if (id == null) {
      return StreamController<List<OtherUserModel>>().stream;
    }

    final streamTransformer = StreamTransformer<
        QuerySnapshot<Map<String, dynamic>>, List<OtherUserModel>>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value.docs.map(OtherUserModel.fromDoc).toList());
      },
    );

    return FirebaseFirestore.instance
        .collection('users')
        .where('id', isNotEqualTo: read(userModelProvider).value?.id)
        .orderBy('id')
        .startAt([id])
        .endAt(['$id\uf8ff'])
        .snapshots()
        .transform(streamTransformer);
  }
}
