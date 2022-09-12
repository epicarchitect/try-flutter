import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = generateWordPairs().take(100).toList();
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map((e) {
            return ListTile(title: Text(e.asPascalCase));
          });

          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(context: context, tiles: tiles).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Favorites'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
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
          final item = _suggestions[i];
          final isSaved = _saved.contains(item);
          return ListTile(
            title: Text(
              item.asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              isSaved ? Icons.favorite : Icons.favorite_border,
              color: isSaved ? Colors.red : Colors.black38,
              semanticLabel: isSaved ? 'Saved' : 'Not saved',
            ),
            onTap: () {
              setState(() {
                if (isSaved) {
                  _saved.remove(item);
                } else {
                  _saved.add(item);
                }
              });
            },
          );
        },
        itemCount: _suggestions.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
