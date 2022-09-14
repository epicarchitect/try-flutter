import 'package:flutter/material.dart';
import 'package:myapp/data/Album.dart';
import 'package:myapp/di/di.dart';
import 'package:myapp/feature/albums/details/widget.dart';

class AlbumsWidget extends StatefulWidget {
  const AlbumsWidget({super.key});

  @override
  State<AlbumsWidget> createState() => _State();
}

class _State extends State<AlbumsWidget> {
  late Future<List<Album>> _futureAlbums;

  @override
  void initState() {
    super.initState();
    _futureAlbums = appDependencies.albumRepository.getAlbums();
  }

  void _openAlbum(Album album) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: FutureBuilder(
        future: _futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final albums = snapshot.data;
            if (albums == null) {
              return Container(
                alignment: Alignment.center,
                child: const Text('Data null'),
              );
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
            return Container(
              alignment: Alignment.center,
              child: Text(snapshot.error.toString()),
            );
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
