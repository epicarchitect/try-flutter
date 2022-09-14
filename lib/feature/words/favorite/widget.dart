import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteWordsArguments {
  final List<WordPair> list;

  FavoriteWordsArguments({required this.list});
}

class FavoriteWordsWidget extends StatelessWidget {
  const FavoriteWordsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = _extractArguments(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper-forest.jpg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: ListView.builder(
          itemBuilder: (_, i) {
            final item = arguments.list[i];
            return ListTile(title: Text(item.asPascalCase));
          },
          itemCount: arguments.list.length,
        ),
      ),
    );
  }
}

FavoriteWordsArguments _extractArguments(BuildContext context) =>
    ModalRoute.of(context)!.settings.arguments as FavoriteWordsArguments;
