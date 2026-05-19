import 'dart:convert';

import 'package:app_spotify/src/auth/model/music_model.dart';

import 'package:http/http.dart' as http;

class MusicService {

  static Future<List<MusicModel>>
      getPlaylistSongs() async {

    final url = Uri.parse(
      'https://deezerdevs-deezer.p.rapidapi.com/search?q=pop',
    );

    final response = await http.get(
      url,

      headers: {
        'X-RapidAPI-Key':
            'SUA_CHAVE_RAPIDAPI',

        'X-RapidAPI-Host':
            'deezerdevs-deezer.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      final List musics =
          data['data'];

      return musics.map((music) {

        return MusicModel.fromMap(
          music,
        );

      }).toList();
    }

    throw Exception(
      'Erro ao carregar músicas',
    );
  }
}