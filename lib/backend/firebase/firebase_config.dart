import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA3gSE6DwmIo9SqBnXo5GmkWT0jI04Gl8s",
            authDomain: "techzoom-80e87.firebaseapp.com",
            projectId: "techzoom-80e87",
            storageBucket: "techzoom-80e87.appspot.com",
            messagingSenderId: "1044293818777",
            appId: "1:1044293818777:web:bbdf3921ef71ecf365db08",
            measurementId: "G-7CRXNSN78V"));
  } else {
    await Firebase.initializeApp();
  }
}
