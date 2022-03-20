import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/screens/sign_in_screen.dart';

void main() {
  // debugPaintSizeEnabled = true;

  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mal Learn',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: SignInScreen(),
    );
  }
}
