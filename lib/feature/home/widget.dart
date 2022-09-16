import 'package:flutter/material.dart';
import 'package:myapp/di/di.dart';
import 'package:myapp/feature/albums/model.dart';
import 'package:myapp/feature/albums/widget.dart';
import 'package:myapp/feature/albums/widget_model.dart';
import 'package:myapp/feature/auth/widget.dart';
import 'package:myapp/feature/words/widget.dart';
import 'package:myapp/main.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({super.key}) {
    initLog();
  }

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedTab = 0;

  _HomeWidgetState() {
    initLog();
  }

  final _pages = [
    WordsWidget(),
    AlbumsWidget(
        (_) => AlbumsWidgetModel(AlbumsModel(appDependencies.albumRepository))),
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
