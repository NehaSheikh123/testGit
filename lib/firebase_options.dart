// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD4yA5rVSvT-uxJrl8W3PZKXGUL62BlBHA',
    appId: '1:396265235280:web:fd8acca7f44fdd57a2c255',
    messagingSenderId: '396265235280',
    projectId: 'fir-project-fee17',
    authDomain: 'fir-project-fee17.firebaseapp.com',
    storageBucket: 'fir-project-fee17.appspot.com',
    databaseURL: 'https://fir-project-fee17-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwq6SMsWDvC49g2GWw7_JZw3eWdVdtRNw',
    appId: '1:396265235280:android:06a718c4ee2ea999a2c255',
    messagingSenderId: '396265235280',
    projectId: 'fir-project-fee17',
    storageBucket: 'fir-project-fee17.appspot.com',
    databaseURL: 'https://fir-project-fee17-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsR_BeUWZTHZhJ-kyDAUP2MgHFzbgGAZs',
    appId: '1:396265235280:ios:b440bed6734683e1a2c255',
    messagingSenderId: '396265235280',
    projectId: 'fir-project-fee17',
    storageBucket: 'fir-project-fee17.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
    databaseURL: 'https://fir-project-fee17-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsR_BeUWZTHZhJ-kyDAUP2MgHFzbgGAZs',
    appId: '1:396265235280:ios:b440bed6734683e1a2c255',
    messagingSenderId: '396265235280',
    projectId: 'fir-project-fee17',
    storageBucket: 'fir-project-fee17.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
    databaseURL: 'https://fir-project-fee17-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD4yA5rVSvT-uxJrl8W3PZKXGUL62BlBHA',
    appId: '1:396265235280:web:912b815694af0339a2c255',
    messagingSenderId: '396265235280',
    projectId: 'fir-project-fee17',
    authDomain: 'fir-project-fee17.firebaseapp.com',
    storageBucket: 'fir-project-fee17.appspot.com',
    databaseURL: 'https://fir-project-fee17-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );
}
