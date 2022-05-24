import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/chat_room_model.dart';
import 'package:mal_learn/providers/user_provider.dart';

class UserRepository {
  UserRepository(this.read, this.watch);

  final Reader read;
  final T Function<T>(AlwaysAliveProviderListenable<T>) watch;

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchFirestoreDocument(
    String uid,
  ) async {
    return FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  Future<String> fetchUserId(String uid) async {
    final document = await fetchFirestoreDocument(uid);
    return document.data()!['id'] as String;
  }

  Future<String> fetchUserName(String uid) async {
    final document = await fetchFirestoreDocument(uid);
    return document.data()!['userName'] as String;
  }

  Future<ImageProvider> fetchUserIcon(String uid) async {
    final document = await fetchFirestoreDocument(uid);
    final iconUrl = document.data()!['iconUrl'] as String?;
    if (iconUrl != null) {
      return NetworkImage(iconUrl);
    } else {
      return const AssetImage('assets/images/default_icon.png');
    }
  }

  Future<ImageProvider> fetchUserBackgroundImage(String uid) async {
    final document = await fetchFirestoreDocument(uid);
    final backgroundImageUrl = document.data()!['backgroundUrl'] as String?;
    if (backgroundImageUrl != null) {
      return NetworkImage(backgroundImageUrl);
    } else {
      return const AssetImage('assets/images/default_background.jpeg');
    }
  }

  void makeFriendsWith(String uid) {
    final uid = read(userProvider).value!.uid;

    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'friends': FieldValue.arrayUnion(<String>[uid])
    });
  }

  Stream<List<ChatRoom>> fetchJoinedChatRoomList(String uid) {
    final transformer = StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
        List<ChatRoom>>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value.docs.map(ChatRoom.fromDoc).toList());
      },
    );

    return FirebaseFirestore.instance
        .collection('rooms')
        .where('members', arrayContains: uid)
        // .orderBy('lastMessageAt')
        .snapshots()
        .transform(transformer);
  }
}
