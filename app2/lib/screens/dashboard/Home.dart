import 'package:flutter/material.dart';

import '../Guest.dart';
import '../services/UserService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // await _userService.logout();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => GuestScreen(),
                ),
                    (route) => false,
              );
            },
            child: Text('logout'),
          ),
        ),
      ),
    );
  }
}
