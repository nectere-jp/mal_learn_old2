import 'package:flutter/material.dart';
import 'package:mal_learn/models/other_user_model.dart';
import 'package:mal_learn/widgets/clipped_background_image.dart';
import 'package:mal_learn/widgets/make_friends_button.dart';
import 'package:mal_learn/widgets/user_icon.dart';

void showOtherUserModal(BuildContext context, OtherUserModel user) {
  showModalBottomSheet<DecoratedBox>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 260,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const BackgroundImage(),
                  UserIcon(icon: user.iconProvider!),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user.userName ?? '[ユーザー名が指定されていません]',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              user.id ?? '[idが設定されていません]',
              style: TextStyle(
                fontSize: 12,
                color: Colors.teal.shade300,
              ),
            ),
            const SizedBox(height: 40),
            MakeFriendsButton(user),
          ],
        ),
      );
    },
  );
}
