import 'package:flutter/material.dart';

import '../data/Album.dart';

class AlbumScreen extends StatelessWidget {
  final Album album;

  const AlbumScreen({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('id: ${album.id}'),
        Text('userId: ${album.userId}'),
        Text('title: ${album.title}')
      ],
    );
  }
}
