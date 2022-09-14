import 'package:flutter/material.dart';

import 'package:myapp/data/Album.dart';

class AlbumDetailsWidget extends StatelessWidget {
  final Album album;

  const AlbumDetailsWidget(this.album, {super.key});

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
