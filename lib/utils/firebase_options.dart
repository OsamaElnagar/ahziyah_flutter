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
    apiKey: 'AIzaSyDJ2pMPb-NahmNJ5WANNLMt5xKmmi5wv2M',
    appId: '1:756648145282:web:57f57f0160f08958fd1f9b',
    messagingSenderId: '756648145282',
    projectId: 'ahziyah-d0a2b',
    authDomain: 'ahziyah-d0a2b.firebaseapp.com',
    storageBucket: 'ahziyah-d0a2b.firebasestorage.app',
    measurementId: 'G-2KB1D8K0Y0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0mD-D5jIpj6-WjWs-6lx4L_vVr9t1Rm0',
    appId: '1:756648145282:android:5a8b88cdd706ccc5fd1f9b',
    messagingSenderId: '756648145282',
    projectId: 'ahziyah-d0a2b',
    storageBucket: 'ahziyah-d0a2b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTW-8mpAmtvVeWa1ovrhATHBOoxs3ci6g',
    appId: '1:756648145282:ios:3415cb609e7aa245fd1f9b',
    messagingSenderId: '756648145282',
    projectId: 'ahziyah-d0a2b',
    storageBucket: 'ahziyah-d0a2b.firebasestorage.app',
    iosBundleId: 'com.example.ahziyahFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTW-8mpAmtvVeWa1ovrhATHBOoxs3ci6g',
    appId: '1:756648145282:ios:3415cb609e7aa245fd1f9b',
    messagingSenderId: '756648145282',
    projectId: 'ahziyah-d0a2b',
    storageBucket: 'ahziyah-d0a2b.firebasestorage.app',
    iosBundleId: 'com.example.ahziyahFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDJ2pMPb-NahmNJ5WANNLMt5xKmmi5wv2M',
    appId: '1:756648145282:web:11f060d4301860c8fd1f9b',
    messagingSenderId: '756648145282',
    projectId: 'ahziyah-d0a2b',
    authDomain: 'ahziyah-d0a2b.firebaseapp.com',
    storageBucket: 'ahziyah-d0a2b.firebasestorage.app',
    measurementId: 'G-RNWJNHWNMD',
  );
}
