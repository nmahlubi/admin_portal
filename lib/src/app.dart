import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomah/src/screens/home.dart';
import 'package:nomah/src/screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        accentColor: Colors.orange,
        primaryColor: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
