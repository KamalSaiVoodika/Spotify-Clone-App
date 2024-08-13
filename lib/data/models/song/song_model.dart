// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:avis/domain/entities/song/song_entity.dart';

class SongModel {
  final String title;
  final String artist;
  final num duration;
  final String starCast;
  final String cover;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.starCast,
    required this.cover,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'artist': artist,
      'duration': duration,
      'star_cast': starCast,
      'cover': cover,
    };
  }

  factory SongModel.fromJson(Map<String, dynamic> map) {
    return SongModel(
        title: map['title'] as String,
        artist: map['artist'] as String,
        duration: map['duration'] as num,
        starCast: map['star_cast'] as String,
        cover: map['cover'] as String);
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title,
      artist: artist,
      duration: duration,
      starCast: starCast,
      cover: cover,
    );
  }
}
