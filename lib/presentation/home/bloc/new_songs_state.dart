import 'package:avis/domain/entities/song/song_entity.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;
  NewsSongsLoaded(this.songs);
}

class NewsSongsFailure extends NewsSongsState {}
