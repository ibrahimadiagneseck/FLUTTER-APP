import 'package:app2/screens/Guest.dart';
import 'package:app2/screens/guest/Auth.dart';
import 'package:app2/screens/guest/Term.dart';
import 'package:app2/screens/guest/Password.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'DefaultFirebaseOptions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Assurez-vous que les options ne sont pas nulles : pour le web
  );

  runApp(const MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   final List<CameraDescription> cameras = await availableCameras();
//
//   await Firebase.initializeApp();
//
//   runApp(App(
//     cameras: cameras,
//   ));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App 2',
      // home: TermScreen(
      //   onChangedStep: (int? step, String password) {
      //     // Implement your logic here
      //     if (kDebugMode) {
      //       print('Step: $step, Password: $password');
      //     }
      //   },
      // ),
      home: GuestScreen(),
    );
  }
}

