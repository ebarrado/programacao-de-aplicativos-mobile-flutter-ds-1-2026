import 'package:app_spotify/src/auth/controller/music_service.dart';
import 'package:app_spotify/src/auth/model/music_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayListSreen extends StatefulWidget {
  const PlayListSreen({super.key});

  @override
  State<PlayListSreen> createState() =>
      _PlayListSreenState();
}

class _PlayListSreenState
    extends State<PlayListSreen> {

  late Future<List<MusicModel>>
      musicsFuture;

  final AudioPlayer audioPlayer =
      AudioPlayer();

  String currentMusic = '';

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    musicsFuture =
        MusicService.getPlaylistSongs();
  }

  @override
  void dispose() {

    audioPlayer.dispose();

    super.dispose();
  }

  Future<void> tocarMusica(
    MusicModel music,
  ) async {

    try {

      // PAUSAR
      if (currentMusic ==
              music.preview &&
          isPlaying) {

        await audioPlayer.pause();

        setState(() {

          isPlaying = false;
        });

        return;
      }

      // TOCAR NOVA
      await audioPlayer.stop();

      await audioPlayer.play(
        UrlSource(
          music.preview,
        ),
      );

      setState(() {

        currentMusic =
            music.preview;

        isPlaying = true;
      });

    } catch (e) {

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(
          backgroundColor:
              Colors.red,

          content: Text(
            'Erro ao tocar música: $e',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      body: FutureBuilder<
          List<MusicModel>>(
        future: musicsFuture,

        builder: (
          context,
          snapshot,
        ) {

          // LOADING
          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child:
                  CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }

          // ERROR
          if (snapshot.hasError) {

            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.all(
                  20,
                ),

                child: Text(
                  snapshot.error
                      .toString(),

                  style:
                      const TextStyle(
                    color:
                        Colors.white,

                    fontSize: 16,
                  ),

                  textAlign:
                      TextAlign.center,
                ),
              ),
            );
          }

          final musics =
              snapshot.data ?? [];

          // EMPTY
          if (musics.isEmpty) {

            return const Center(
              child: Text(
                "Nenhuma música encontrada",

                style: TextStyle(
                  color:
                      Colors.white,
                ),
              ),
            );
          }

          return CustomScrollView(
            slivers: [

              // APP BAR
              SliverAppBar(
                backgroundColor:
                    Colors.black,

                expandedHeight: 320,

                pinned: true,

                flexibleSpace:
                    FlexibleSpaceBar(

                  background: Stack(
                    fit: StackFit.expand,

                    children: [

                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLNUPFiKphlZavWU7RmxhHgYqCA4vv7Vbacg&s',

                        fit:
                            BoxFit.cover,
                      ),

                      Container(
                        decoration:
                            const BoxDecoration(
                          gradient:
                              LinearGradient(
                            begin:
                                Alignment
                                    .bottomCenter,

                            end:
                                Alignment
                                    .topCenter,

                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      const Positioned(
                        left: 20,
                        bottom: 30,

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            Text(
                              " Minha PlayList 1",

                              style:
                                  TextStyle(
                                color:
                                    Colors.white,

                                fontSize:
                                    42,

                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              "Sua Playlist Spotify",

                              style:
                                  TextStyle(
                                color:
                                    Colors.white70,

                                fontSize:
                                    16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // LISTA DE MUSICAS
              SliverList(
                delegate:
                    SliverChildBuilderDelegate(
                  (
                    context,
                    index,
                  ) {

                    final music =
                        musics[index];

                    final tocando =
                        currentMusic ==
                                music.preview &&
                            isPlaying;

                    return ListTile(

                      leading:
                          ClipRRect(
                        borderRadius:
                            BorderRadius.circular(
                          6,
                        ),

                        child:
                            Image.network(
                          music.cover,

                          width: 55,
                          height: 55,

                          fit:
                              BoxFit.cover,
                        ),
                      ),

                      title: Text(
                        music.title,

                        style:
                            const TextStyle(
                          color:
                              Colors.white,

                          fontWeight:
                              FontWeight.bold,

                          fontSize: 16,
                        ),
                      ),

                      subtitle: Text(
                        music.artist,

                        style:
                            const TextStyle(
                          color:
                              Colors.grey,
                        ),
                      ),

                      trailing: Icon(
                        tocando
                            ? Icons.pause_circle
                            : Icons.play_circle,

                        color:
                            Colors.green,

                        size: 34,
                      ),

                      onTap: () async {

                        await tocarMusica(
                          music,
                        );
                      },
                    );
                  },

                  childCount:
                      musics.length,
                ),
              ),
            ],
          );
        },
      ),

      // PLAYER BAR
      bottomNavigationBar:
          Container(
        height: 70,

        decoration:
            BoxDecoration(
          color:
              Colors.grey.shade900,

          border: Border(
            top: BorderSide(
              color:
                  Colors.grey.shade800,
            ),
          ),
        ),

        child: Row(
          children: [

            const SizedBox(width: 15),

            Icon(
              isPlaying
                  ? Icons.graphic_eq
                  : Icons.music_note,

              color: Colors.green,

              size: 30,
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Text(
                isPlaying
                    ? "Tocando Música..."
                    : "Nenhuma música tocando",

                style:
                    const TextStyle(
                  color:
                      Colors.white,

                  fontSize: 16,
                ),
              ),
            ),

            IconButton(
              onPressed: () async {

                if (isPlaying) {

                  await audioPlayer.pause();

                  setState(() {

                    isPlaying = false;
                  });
                }
              },

              icon: Icon(
                isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,

                color:
                    Colors.white,
              ),
            ),

            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}