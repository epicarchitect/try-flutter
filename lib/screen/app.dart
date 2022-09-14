import 'package:flutter/material.dart';
import 'package:flutter_test_app/screen/home.dart';
import 'package:flutter_test_app/screen/random_words.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp title',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white
        )
      ),
      routes: {
        '/': (_) => const HomeScreen(),
        '/favorite_words': (_) => const FavoriteWords(),
      },
    );
  }
}
