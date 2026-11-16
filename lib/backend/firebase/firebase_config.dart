import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: const String.fromEnvironment('FIREBASE_WEB_API_KEY'),
            authDomain:
                const String.fromEnvironment('FIREBASE_WEB_AUTH_DOMAIN'),
            projectId: const String.fromEnvironment('FIREBASE_WEB_PROJECT_ID'),
            storageBucket:
                const String.fromEnvironment('FIREBASE_WEB_STORAGE_BUCKET'),
            messagingSenderId:
                const String.fromEnvironment('FIREBASE_WEB_MESSAGING_SENDER_ID'),
            appId: const String.fromEnvironment('FIREBASE_WEB_APP_ID'),
            measurementId:
                const String.fromEnvironment('FIREBASE_WEB_MEASUREMENT_ID')));
  } else {
    await Firebase.initializeApp();
  }
}
