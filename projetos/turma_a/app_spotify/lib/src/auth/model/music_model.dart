class MusicModel {

  final String title;
  final String artist;
  final String cover;
  final String preview;

  MusicModel({
    required this.title,
    required this.artist,
    required this.cover,
    required this.preview,
  });

  factory MusicModel.fromMap(
    Map<String, dynamic> map,
  ) {

    return MusicModel(
      title: map['title'] ?? '',

      artist:
          map['artist']?['name'] ?? '',

      cover:
          map['album']?['cover_medium'] ?? '',

      preview:
          map['preview'] ?? '',
    );
  }
}