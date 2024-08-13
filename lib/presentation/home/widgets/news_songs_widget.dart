import 'package:avis/core/config/constants/app_urls.dart';
import 'package:avis/domain/entities/song/song_entity.dart';
import 'package:avis/presentation/home/bloc/new_songs_cubit.dart';
import 'package:avis/presentation/home/bloc/new_songs_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsSongsWidget extends StatelessWidget {
  const NewsSongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }

            if (state is NewsSongsLoaded) {
              return listView(songs: state.songs);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

Widget listView({required List<SongEntity> songs}) {
  return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => SizedBox(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "${AppUrls.firestorage}${songs[index].cover}${AppUrls.altMedia}",
                    ),
                  ),
                ),
              )
            ],
          )),
      separatorBuilder: (context, index) => const SizedBox(
            width: 14,
          ),
      itemCount: songs.length);
}
