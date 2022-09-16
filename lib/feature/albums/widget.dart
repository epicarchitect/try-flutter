import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:myapp/data/Album.dart';
import 'package:myapp/feature/albums/details/widget.dart';
import 'package:myapp/feature/albums/widget_model.dart';
import 'package:myapp/main.dart';

class AlbumsWidget extends ElementaryWidget<AlbumsWidgetModel> {
  AlbumsWidget(super.wmFactory, {super.key}) {
    initLog();
  }

  void _openAlbum(BuildContext context, Album album) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Album Details'),
            ),
            body: AlbumDetailsWidget(album),
          );
        },
      ),
    );
  }

  @override
  Widget build(AlbumsWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: ValueListenableBuilder(
        valueListenable: wm.albums,
        builder: (context, albums, _) {
          if (albums.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(albums[i].title),
                  onTap: () => _openAlbum(context, albums[i]),
                );
              },
              itemCount: albums.length,
            ).build(context);
          }

          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}