import 'package:elementary/elementary.dart';
import 'package:myapp/data/Album.dart';
import 'package:myapp/main.dart';
import 'package:myapp/repository/album.dart';

class AlbumsModel extends ElementaryModel {
  final AlbumRepository _albumRepository;

  AlbumsModel(this._albumRepository) {
    initLog();
  }

  Future<List<Album>> getAlbums() => _albumRepository.getAlbums();

}
