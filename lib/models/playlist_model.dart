import 'package:musicapp/models/song_model.dart';

class Playlist {
  final String coverUrl;
  final String name;
  final String? description;
  final List<Song> songs;

  Playlist({
    required this.coverUrl,
    required this.name,
    this.description,
    required this.songs,
  });

  static List<Playlist> playlist = [
    Playlist(
        description:
            'A sound originating in West Africa in the 21st century, one that takes in diverse influences and is an eclectic combination of genres such as hip hop, house, jùjú, ndombolo, R&B and soca',
        coverUrl: 'https://bit.ly/3qazGpz',
        name: 'Afrobeats',
        songs: Song.songs),
    Playlist(
        description:
            'The popularity of hip hop music continued through the late 1990s to early-2000s "bling era" with hip hop influences increasingly finding their way into other genres of popular music, such as neo soul, nu metal, and R&B. ',
        coverUrl: 'https://bit.ly/3RjgSQF',
        name: 'HipHop',
        songs: Song.songs),
    Playlist(
        description:
            'Amapiano (isizulu for "the pianos") is a style of house music that emerged in South Africa in 2012. It is a hybrid of deep house, jazz and lounge music characterized by synths, airy pads and wide percussive basslines. It is distinguished by high-pitched piano melodies, Kwaito basslines, low tempo 90s South African house rhythms and percussions from another local subgenre of house known as Bacardi.',
        coverUrl: 'https://bit.ly/3Bhn723',
        name: 'Amapiano',
        songs: Song.songs)
  ];
}
