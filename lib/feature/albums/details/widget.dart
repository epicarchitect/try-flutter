import 'package:flutter/material.dart';
import 'package:myapp/data/Album.dart';
import 'package:myapp/main.dart';

class AlbumDetailsWidget extends StatelessWidget {
  final Album album;

  AlbumDetailsWidget(this.album, {super.key}) {
    initLog();
  }

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
