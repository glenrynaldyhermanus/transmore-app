import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBEUcvjQwRe2bM4TksmCyhYPXuHuiN0lAE",
            authDomain: "transmore-967bc.firebaseapp.com",
            projectId: "transmore-967bc",
            storageBucket: "transmore-967bc.firebasestorage.app",
            messagingSenderId: "815771276633",
            appId: "1:815771276633:web:f036cc8b4d1d2d21bde848",
            measurementId: "G-3SH2VX636Q"));
  } else {
    await Firebase.initializeApp();
  }
}
