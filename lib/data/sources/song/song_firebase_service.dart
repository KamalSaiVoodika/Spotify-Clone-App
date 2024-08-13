import 'dart:developer';

import 'package:avis/data/models/song/song_model.dart';
import 'package:avis/domain/entities/song/song_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      log('<<Api Call>>>');
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('telugu_songs')
          .orderBy('title')
          .limit(3)
          .get();
      for (var element in data.docs) {
        SongModel songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return const Left(
          'Something Went Wrong, SomethingWent wrong please try again');
    }
  }
}
