import 'package:avis/core/usecase/usecase.dart';
import 'package:avis/data/repository/song/songs_repository_impl.dart';
import 'package:avis/domain/repository/song/song_repository.dart';
import 'package:avis/service_locator.dart';
import 'package:dartz/dartz.dart';

class SongUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getSongs();
  }
}
