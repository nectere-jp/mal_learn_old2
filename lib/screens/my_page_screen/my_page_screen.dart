import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/user_provider.dart';
import 'package:mal_learn/screens/my_page_screen/search_friends_buttons.dart';
import 'package:mal_learn/screens/my_page_screen/user_profile.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends ConsumerWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(userProvider).value?.uid;

    if (uid == null) {
      return const CircularProgressIndicator();
    }

    return Column(
      children: const [
        UserProfile(),
        SizedBox(height: 30),
        SearchFriendsButtons(),
      ],
    );
  }
}
