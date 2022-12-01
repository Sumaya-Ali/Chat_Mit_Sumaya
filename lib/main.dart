import 'package:chat_mit_sumaya/screens/register_screen.dart';
import 'package:chat_mit_sumaya/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat mit Sumaya',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
    );
  }
}

