import 'dart:ffi';

import 'package:avis/domain/usecases/song/song_usecase.dart';
import 'package:avis/presentation/home/bloc/new_songs_state.dart';
import 'package:avis/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewSongs() async {
    var returnedSongs = await sl<SongUsecase>().call();

    returnedSongs.fold(
      (l) {
        emit(NewsSongsFailure());
      },
      (data) {
        emit(NewsSongsLoaded(data));
      },
    );
  }
}
