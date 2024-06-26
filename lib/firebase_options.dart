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
    apiKey: 'AIzaSyBmh1Cx9RAUjdMfANbMznhgHBo6uCrgEUE',
    appId: '1:639549190722:web:3d7f46c778b4557ae7b3db',
    messagingSenderId: '639549190722',
    projectId: 'panic-link',
    authDomain: 'panic-link.firebaseapp.com',
    storageBucket: 'panic-link.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsVPELwAA-AKPQwT5RFG_5seDgwXEUJh0',
    appId: '1:639549190722:android:1c794d29964a2151e7b3db',
    messagingSenderId: '639549190722',
    projectId: 'panic-link',
    storageBucket: 'panic-link.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnW4WVH574gA-7qUuNGnyuCAM9rYTBSWI',
    appId: '1:639549190722:ios:ccb04000905d5540e7b3db',
    messagingSenderId: '639549190722',
    projectId: 'panic-link',
    storageBucket: 'panic-link.appspot.com',
    iosBundleId: 'com.paniclink.panicLink',
  );
}
