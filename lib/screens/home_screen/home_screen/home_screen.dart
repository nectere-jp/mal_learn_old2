import 'package:flutter/material.dart';
import 'package:mal_learn/screens/home_screen/chat_list_screen/chat_list_screen.dart';
import 'package:mal_learn/screens/home_screen/my_page_screen/my_page_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageViewController = PageController(initialPage: 1);
  var _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: const [
          MyPageScreen(),
          ChatListScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageViewController.animateToPage(
            index,
            duration: const Duration(microseconds: 200),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 35),
            label: 'マイページ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum, size: 32),
            label: 'チャット',
          ),
        ],
      ),
    );
  }
}
