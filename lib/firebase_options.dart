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
    apiKey: 'AIzaSyAf8xBIVwpGhmFZ_BvMlOdOReuVOGfBh4w',
    appId: '1:922986327131:web:d121add952c0e78d1fe37e',
    messagingSenderId: '922986327131',
    projectId: 'buildwealth-c90b8',
    authDomain: 'buildwealth-c90b8.firebaseapp.com',
    storageBucket: 'buildwealth-c90b8.appspot.com',
    measurementId: 'G-LGMZ8RGFFD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUBqod9Ok5ezeyLvutv0Isp_pbOGzRIfw',
    appId: '1:922986327131:android:f9c55c13f73003c91fe37e',
    messagingSenderId: '922986327131',
    projectId: 'buildwealth-c90b8',
    storageBucket: 'buildwealth-c90b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAavLMJjqAUAEOJ1ukAcZg_8cEPm_z6yv4',
    appId: '1:922986327131:ios:67649fa5e9c6964e1fe37e',
    messagingSenderId: '922986327131',
    projectId: 'buildwealth-c90b8',
    storageBucket: 'buildwealth-c90b8.appspot.com',
    iosBundleId: 'com.example.allamcoProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAavLMJjqAUAEOJ1ukAcZg_8cEPm_z6yv4',
    appId: '1:922986327131:ios:9ed7f4a52bfb1abe1fe37e',
    messagingSenderId: '922986327131',
    projectId: 'buildwealth-c90b8',
    storageBucket: 'buildwealth-c90b8.appspot.com',
    iosBundleId: 'com.example.allamcoProject.RunnerTests',
  );
}