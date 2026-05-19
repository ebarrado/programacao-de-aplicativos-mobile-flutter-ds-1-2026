import 'package:app_spotify/src/auth/controller/music_service.dart';
import 'package:app_spotify/src/auth/model/music_model.dart';

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

  @override
  void initState() {
    super.initState();

    musicsFuture =
        MusicService.getPlaylistSongs();
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

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child:
                  CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }

          if (snapshot.hasError) {

            return Center(
              child: Text(
                snapshot.error
                    .toString(),

                style:
                    const TextStyle(
                  color:
                      Colors.white,
                ),
              ),
            );
          }

          final musics =
              snapshot.data ?? [];

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
                        'https://i.scdn.co/image/ab67706f00000002db4d4c7f2c44e4d9b7b4f6cb',

                        fit:
                            BoxFit.cover,
                      ),

                      Container(
                        decoration:
                            BoxDecoration(
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
                              "Pop Up",

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

              // LISTA
              SliverList(
                delegate:
                    SliverChildBuilderDelegate(
                  (
                    context,
                    index,
                  ) {

                    final music =
                        musics[index];

                    return ListTile(

                      leading:
                          ClipRRect(
                        borderRadius:
                            BorderRadius.circular(
                          4,
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

                      trailing:
                          const Icon(
                        Icons.more_vert,

                        color:
                            Colors.white,
                      ),

                      onTap: () {

                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                Colors.green,

                            content: Text(
                              "Tocando ${music.title}",
                            ),
                          ),
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

      bottomNavigationBar:
          BottomNavigationBar(
        backgroundColor:
            Colors.black,

        selectedItemColor:
            Colors.green,

        unselectedItemColor:
            Colors.white,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Buscar",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_music,
            ),
            label: "Biblioteca",
          ),
        ],
      ),
    );
  }
}