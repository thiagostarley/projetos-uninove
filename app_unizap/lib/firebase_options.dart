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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBS70Gmomko5vxUqhLG7ePING52fnop4Mo',
    appId: '1:279889223179:web:5425fa748015fc0907310e',
    messagingSenderId: '279889223179',
    projectId: 'unizap-bb989',
    authDomain: 'unizap-bb989.firebaseapp.com',
    storageBucket: 'unizap-bb989.appspot.com',
    measurementId: 'G-HSN5G2B7K8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnvAlN2k1wuoPX_dcHPELvUhP4OdTyMpw',
    appId: '1:279889223179:android:15a1531473b4096907310e',
    messagingSenderId: '279889223179',
    projectId: 'unizap-bb989',
    storageBucket: 'unizap-bb989.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3zJORtI8GsjQz-wgM8-ufykBl2MtIcig',
    appId: '1:279889223179:ios:bfc34469fca986fe07310e',
    messagingSenderId: '279889223179',
    projectId: 'unizap-bb989',
    storageBucket: 'unizap-bb989.appspot.com',
    iosClientId: '279889223179-d3cbu2pku09ivopp6jm1diaf0knh1l1g.apps.googleusercontent.com',
    iosBundleId: 'br.uninove.unizap.appUnizap',
  );
}
