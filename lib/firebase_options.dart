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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByrxO45uqvtpTaZ07_Dg5bcFftUIPet8g',
    appId: '1:346442533727:android:dc16ba1c6e8e95ecf804ea',
    messagingSenderId: '346442533727',
    projectId: 'dogexpress-30ff0',
    databaseURL: 'https://dogexpress-30ff0-default-rtdb.firebaseio.com',
    storageBucket: 'dogexpress-30ff0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0trLS8U7z7sgIrPptW18-qS8rknAbCAI',
    appId: '1:346442533727:ios:aa1faa070e4c7973f804ea',
    messagingSenderId: '346442533727',
    projectId: 'dogexpress-30ff0',
    databaseURL: 'https://dogexpress-30ff0-default-rtdb.firebaseio.com',
    storageBucket: 'dogexpress-30ff0.appspot.com',
    iosClientId: '346442533727-gete8b3cj00avbs9qpdgcahgc63a7i0u.apps.googleusercontent.com',
    iosBundleId: 'com.example.dogNews',
  );
}
