import 'package:flutter/material.dart';
import 'package:myapp/feature/albums/widget.dart';
import 'package:myapp/feature/auth/widget.dart';
import 'package:myapp/feature/words/widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _State();
}

class _State extends State<HomeWidget> {
  int _selectedTab = 0;

  final _pages = const [
    WordsWidget(),
    AlbumsWidget(),
    AuthWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
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
        onTap: (i) => setState(() => _selectedTab = i),
      ),
    );
  }
}
