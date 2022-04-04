import 'package:flutter/material.dart';
import 'package:mal_learn/models/other_user_model.dart';

void showOtherUserModal(BuildContext context, OtherUserModel user) {
  showModalBottomSheet<DecoratedBox>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: user.backgroundProvider!,
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text('Text'),
          ),
        ),
      );
    },
  );
}
