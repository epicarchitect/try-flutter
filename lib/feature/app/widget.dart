import 'package:flutter/material.dart';
import 'package:myapp/feature/home/widget.dart';
import 'package:myapp/feature/words/favorite/widget.dart';

class AppWidget extends MaterialApp {
  AppWidget({super.key})
      : super(
          title: 'MaterialApp title',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
          routes: {
            '/': (_) => const HomeWidget(),
            '/favorite_words': (_) => const FavoriteWordsWidget(),
          },
        );
}
