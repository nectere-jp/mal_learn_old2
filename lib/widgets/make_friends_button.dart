import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mal_learn/models/other_user_model.dart';
import 'package:mal_learn/providers/repository_provider.dart';

class MakeFriendsButton extends ConsumerWidget {
  const MakeFriendsButton(
    this.user, {
    Key? key,
  }) : super(key: key);

  final OtherUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      onPressed: () {
        try {
          ref.read(repositoryProvider).makeFriendsWith(user.uid);
        } on Exception catch (e) {
          Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.deepOrange[900],
          );
        }
      },
      child: Column(
        children: const [
          Icon(
            Icons.person_add_rounded,
            size: 40,
          ),
          Text('追加'),
        ],
      ),
    );
  }
}
