import 'package:flutter/material.dart';
import 'package:flutter_test_app/screen/home.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp title',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.black38,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
