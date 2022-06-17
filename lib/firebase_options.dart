// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      // ignore: no_default_cases
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDbkH5H3QLwQrW1Jk15ZPREBCtrBsp_Vvs',
    appId: '1:47070046795:web:85f4a1d8a60cb162f3fbce',
    messagingSenderId: '47070046795',
    projectId: 'mal-learn',
    authDomain: 'mal-learn.firebaseapp.com',
    storageBucket: 'mal-learn.appspot.com',
    measurementId: 'G-3LBN2VQ4V5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYU-jpumG41XSzGdqkXDxqK-b8XoyBwT0',
    appId: '1:47070046795:android:ccba92dbbd799eb1f3fbce',
    messagingSenderId: '47070046795',
    projectId: 'mal-learn',
    storageBucket: 'mal-learn.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRHawiiMunj70pKScwPjdXf9DnvHxcmik',
    appId: '1:47070046795:ios:51a9a7b7d72915d9f3fbce',
    messagingSenderId: '47070046795',
    projectId: 'mal-learn',
    storageBucket: 'mal-learn.appspot.com',
    iosClientId: '47070046795-j4vuah8a9qf37e80l338ss2bhnia0hjp.apps.googleusercontent.com',
    iosBundleId: 'jp.nectere.mal-learn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRHawiiMunj70pKScwPjdXf9DnvHxcmik',
    appId: '1:47070046795:ios:d8cfd7285af4883ff3fbce',
    messagingSenderId: '47070046795',
    projectId: 'mal-learn',
    storageBucket: 'mal-learn.appspot.com',
    iosClientId: '47070046795-degbqt94slbg0fm6elk75enlemocqktk.apps.googleusercontent.com',
    iosBundleId: 'packagename.malLearn',
  );
}
