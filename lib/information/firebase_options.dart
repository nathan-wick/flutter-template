import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDA_y8pOs-ZiEER0BaUa1ROlOBhl1VcQ7s',
    appId: '1:433337671501:web:f845c99f20e422ed8de104',
    messagingSenderId: '433337671501',
    projectId: 'nathan-wick-flutter-template',
    authDomain: 'nathan-wick-flutter-template.firebaseapp.com',
    storageBucket: 'nathan-wick-flutter-template.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANZrAMKxtsmd13R7HWY8x8nQrJE6St7ow',
    appId: '1:433337671501:android:d24624cc297c3b0e8de104',
    messagingSenderId: '433337671501',
    projectId: 'nathan-wick-flutter-template',
    storageBucket: 'nathan-wick-flutter-template.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDq2bzsv_y8ap1Yzfdi66eYm_iGTDCv4o0',
    appId: '1:433337671501:ios:150a0de4b1bd9c228de104',
    messagingSenderId: '433337671501',
    projectId: 'nathan-wick-flutter-template',
    storageBucket: 'nathan-wick-flutter-template.appspot.com',
    iosBundleId: 'com.nathanwick.flutterTemplate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDq2bzsv_y8ap1Yzfdi66eYm_iGTDCv4o0',
    appId: '1:433337671501:ios:150a0de4b1bd9c228de104',
    messagingSenderId: '433337671501',
    projectId: 'nathan-wick-flutter-template',
    storageBucket: 'nathan-wick-flutter-template.appspot.com',
    iosBundleId: 'com.nathanwick.flutterTemplate',
  );
}
