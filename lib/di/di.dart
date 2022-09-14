import 'package:myapp/repository/album.dart';

class AppDependencies {
  final albumRepository = AlbumRepository();
}

final appDependencies = AppDependencies();
