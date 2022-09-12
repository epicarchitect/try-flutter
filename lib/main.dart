import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp:title',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar:title'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = generateWordPairs().take(100).toList();
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
