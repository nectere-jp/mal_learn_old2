import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OtherUserModel {
  OtherUserModel.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();

    userName = data['userName'] as String?;
    id = data['id'] as String?;

    if (data['iconPath'] != null) {
      iconProvider = NetworkImage(data['iconPath'] as String);
    } else {
      iconProvider = const AssetImage('assets/images/default_icon.png');
    }

    if (data['backgroundPath'] != null) {
      backgroundProvider = NetworkImage(data['backgroundPath'] as String);
    } else {
      backgroundProvider =
          const AssetImage('assets/images/default_background.jpeg');
    }
  }

  String? userName;
  String? id;
  ImageProvider? iconProvider;
  ImageProvider? backgroundProvider;
}
