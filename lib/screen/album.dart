import 'package:flutter/material.dart';

import '../data/Album.dart';

class AlbumScreen extends StatelessWidget {
  final Album album;

  const AlbumScreen(this.album, {super.key});

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
