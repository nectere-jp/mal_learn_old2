import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/screens/sign_in_screen/sign_in_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mal Learn',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SignInScreen(),
    );
  }
}
