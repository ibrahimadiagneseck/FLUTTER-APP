// https://www.youtube.com/watch?v=oaKpdSS2YuU&list=PLdKVEanRftb9MzfasPHY6bh1kkcBIL3Sy&index=4
import 'package:app1/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

