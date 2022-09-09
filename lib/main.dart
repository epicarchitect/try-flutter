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
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(
            _suggestions[i].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
      itemCount: _suggestions.length,
      physics: const BouncingScrollPhysics(),
    );
  }
}
