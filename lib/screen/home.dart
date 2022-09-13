import 'package:flutter/material.dart';
import 'package:flutter_test_app/screen/albums.dart';
import 'package:flutter_test_app/screen/auth.dart';
import 'package:flutter_test_app/screen/random_words.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int selectedTab = 0;
  final pages = const [
    RandomWords(),
    AlbumsScreen(),
    AuthScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wordpress),
            label: 'Words',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Auth',
          ),
        ],
        onTap: (i) => setState(() => selectedTab = i),
      ),
    );
  }
}
