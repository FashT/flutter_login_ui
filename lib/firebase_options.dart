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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBQ4kIBu0fuwiHEZXLfterYRXfJkSEYCeM',
    appId: '1:916489414829:web:998b65a0b7e9cc758bfe24',
    messagingSenderId: '916489414829',
    projectId: 'flutter-ui-login-44bf9',
    authDomain: 'flutter-ui-login-44bf9.firebaseapp.com',
    storageBucket: 'flutter-ui-login-44bf9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXOsd35FN0hai1IyGNH-ipKaxkDF4wDQw',
    appId: '1:916489414829:android:a45079e04719eaad8bfe24',
    messagingSenderId: '916489414829',
    projectId: 'flutter-ui-login-44bf9',
    storageBucket: 'flutter-ui-login-44bf9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjgQdLXYpFxmqIZJ5lGjPVGzrp3AihI4E',
    appId: '1:916489414829:ios:3248493fc7fc647b8bfe24',
    messagingSenderId: '916489414829',
    projectId: 'flutter-ui-login-44bf9',
    storageBucket: 'flutter-ui-login-44bf9.appspot.com',
    iosBundleId: 'com.example.flutterUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjgQdLXYpFxmqIZJ5lGjPVGzrp3AihI4E',
    appId: '1:916489414829:ios:bfc2e3745b85ee398bfe24',
    messagingSenderId: '916489414829',
    projectId: 'flutter-ui-login-44bf9',
    storageBucket: 'flutter-ui-login-44bf9.appspot.com',
    iosBundleId: 'com.example.flutterUi.RunnerTests',
  );
}