import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http;
import 'package:myapp/data/Album.dart';

class AlbumRepository {
  Future<Album?> getAlbum(int id) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'));

    if (response.statusCode == 200) {
      return _albumFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Album>> getAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      return _albumsFromJson(response.body);
    } else {
      return List.empty();
    }
  }

  Album _albumFromJson(String data) {
    final map = jsonDecode(data);
    return Album(userId: map['userId'], id: map['id'], title: map['title']);
  }

  List<Album> _albumsFromJson(String data) => List<Album>.from(
        jsonDecode(data).map(
          (map) => Album(
            userId: map['userId'],
            id: map['id'],
            title: map['title'],
          ),
        ),
      );
}
