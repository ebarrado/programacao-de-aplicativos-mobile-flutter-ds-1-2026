import 'dart:convert';

import 'package:app_spotify/src/auth/model/music_model.dart';
import 'package:http/http.dart'
    as http;

class MusicService {

  static Future<List<MusicModel>>
      getPlaylistSongs() async {

    try {

      final url = Uri.parse(
        'https://itunes.apple.com/search?term=jorge+e+mateus&entity=song&limit=20',
      );

      final response =
          await http.get(url);

      print(response.body);

      if (response.statusCode ==
          200) {

        final data =
            jsonDecode(
          response.body,
        );

        final List musics =
            data['results'];

        return musics.map((music) {

          return MusicModel.fromMap(
            music,
          );

        }).toList();
      }

      throw Exception(
        'Erro HTTP',
      );

    } catch (e) {

      throw Exception(
        'Erro ao carregar músicas: $e',
      );
    }
  }
}