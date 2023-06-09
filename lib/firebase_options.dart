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
    apiKey: 'AIzaSyCjVu-UCL-zzmj5SOy2UMBiAEh5AhXMfyE',
    appId: '1:371128519513:web:d96498f231dc827154da48',
    messagingSenderId: '371128519513',
    projectId: 'alhawari-store-settings',
    authDomain: 'alhawari-store-settings.firebaseapp.com',
    databaseURL: 'https://alhawari-store-settings-default-rtdb.firebaseio.com',
    storageBucket: 'alhawari-store-settings.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrHqXnNm_OR6PkuOqqTdH3jVqsSVx5CTU',
    appId: '1:371128519513:android:fae42e8652dd9d4054da48',
    messagingSenderId: '371128519513',
    projectId: 'alhawari-store-settings',
    databaseURL: 'https://alhawari-store-settings-default-rtdb.firebaseio.com',
    storageBucket: 'alhawari-store-settings.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9JptWea8eq_8A86CdOfkPI5hgZz2fiQk',
    appId: '1:371128519513:ios:184e063be4f0c27f54da48',
    messagingSenderId: '371128519513',
    projectId: 'alhawari-store-settings',
    databaseURL: 'https://alhawari-store-settings-default-rtdb.firebaseio.com',
    storageBucket: 'alhawari-store-settings.appspot.com',
    iosClientId: '371128519513-knaq7hlglud8v23uos29i23k45jhnol9.apps.googleusercontent.com',
    iosBundleId: 'com.example.saleorAppFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9JptWea8eq_8A86CdOfkPI5hgZz2fiQk',
    appId: '1:371128519513:ios:184e063be4f0c27f54da48',
    messagingSenderId: '371128519513',
    projectId: 'alhawari-store-settings',
    databaseURL: 'https://alhawari-store-settings-default-rtdb.firebaseio.com',
    storageBucket: 'alhawari-store-settings.appspot.com',
    iosClientId: '371128519513-knaq7hlglud8v23uos29i23k45jhnol9.apps.googleusercontent.com',
    iosBundleId: 'com.example.saleorAppFlutter',
  );
}
