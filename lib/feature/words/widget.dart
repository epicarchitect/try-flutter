import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:myapp/feature/words/favorite/widget.dart';
import 'package:myapp/main.dart';

class WordsWidget extends StatefulWidget {
  WordsWidget({super.key}) {
    initLog();
  }

  @override
  State<WordsWidget> createState() => _WordsWidgetState();
}

class _WordsWidgetState extends State<WordsWidget> {

  _WordsWidgetState() {
    initLog();
  }

  final _items = generateWordPairs().take(100).toList();
  final _favorite = <WordPair>[];

  void _pushSaved() {
    Navigator.of(context).pushNamed(
      '/favorite_words',
      arguments: FavoriteWordsArguments(list: _favorite),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Words'),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: const Icon(Icons.favorite_sharp),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          final item = _items[i];
          final isSaved = _favorite.contains(item);
          return ListTile(
            title: Text(item.asPascalCase),
            trailing: Icon(
              isSaved ? Icons.favorite : Icons.favorite_border,
              color: isSaved ? Colors.red : Colors.black38,
              semanticLabel: isSaved ? 'Saved' : 'Not saved',
            ),
            onTap: () {
              setState(() {
                if (isSaved) {
                  _favorite.remove(item);
                } else {
                  _favorite.add(item);
                }
              });
            },
          );
        },
        itemCount: _items.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
