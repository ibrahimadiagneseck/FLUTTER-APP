import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web; // Puisque nous configurons pour le Web
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyD_mZip3UytDRcMaFYEeC5esJXl_9y_y5Y",  // Clé API
    authDomain: "app2-5415c.firebaseapp.com",            // Auth domain Firebase
    projectId: "app2-5415c",                             // ID du projet
    storageBucket: "app2-5415c.appspot.com",             // Bucket de stockage Firebase
    messagingSenderId: "1088969939955",                  // Sender ID Firebase
    appId: "1:1088969939955:android:51a69ca5261f72fa315086", // ID de l'application Firebase
    measurementId: "G-XXXXXXX",  // Vous devrez trouver cette valeur dans votre console Firebase, elle est optionnelle
  );
}
