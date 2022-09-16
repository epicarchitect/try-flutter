import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/data/Album.dart';
import 'package:myapp/feature/albums/model.dart';
import 'package:myapp/feature/albums/widget.dart';
import 'package:myapp/main.dart';

class AlbumsWidgetModel extends WidgetModel<AlbumsWidget, AlbumsModel> {
  final albums = ValueNotifier<List<Album>>(List.empty());

  AlbumsWidgetModel(super.model) {
    initLog();
    refresh();
  }

  void refresh() async {
    albums.value = await model.getAlbums();
  }
}
