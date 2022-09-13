import 'package:flutter/material.dart';

import '../data/Album.dart';
import '../di/di.dart';
import 'album.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = appDependencies.albumRepository.getAlbums();
  }

  void _openAlbum(Album album) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('album screen'),
            ),
            body: AlbumScreen(album),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('album screen'),
      ),
      body: FutureBuilder(
        future: futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final albums = snapshot.data;
            if (albums == null) {
              return const Text('Data null');
            }

            return ListView.builder(
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(albums[i].title),
                  onTap: () => _openAlbum(albums[i]),
                );
              },
              itemCount: albums.length,
            ).build(context);
          }

          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
