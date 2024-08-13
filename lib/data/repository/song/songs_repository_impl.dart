import 'package:avis/data/sources/song/song_firebase_service.dart';
import 'package:avis/domain/repository/song/song_repository.dart';
import 'package:avis/service_locator.dart';
import 'package:dartz/dartz.dart';

class SongsRepositoryImpl implements SongsRepository {
  @override
  Future<Either> getSongs() {
    return sl<SongFirebaseService>().getNewSongs();
  }
}
