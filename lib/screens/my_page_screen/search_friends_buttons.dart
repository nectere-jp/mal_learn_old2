import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/screens/my_page_screen/search_friends_by_id_modal.dart';

class SearchFriendsButtons extends ConsumerWidget {
  const SearchFriendsButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 230, 236, 236),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 12,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '友達を追加',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _AddFriendsButton(
                  icon: Icons.search,
                  text: 'ID検索',
                  onPressed: () => addFriendsWithId(context, ref),
                ),
                const SizedBox(width: 10),
                _AddFriendsButton(
                  icon: Icons.qr_code_scanner,
                  text: 'QRコード',
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                _AddFriendsButton(
                  icon: Icons.link,
                  text: 'リンクを送信',
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AddFriendsButton extends StatelessWidget {
  const _AddFriendsButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        color: Colors.white,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.blueGrey.shade600,
            ),
            const SizedBox(height: 5),
            Text(text, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
