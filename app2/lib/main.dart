import 'package:app2/screens/Guest.dart';
import 'package:app2/screens/guest/Auth.dart';
import 'package:app2/screens/guest/Term.dart';
import 'package:app2/screens/guest/Password.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
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

