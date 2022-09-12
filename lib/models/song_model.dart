class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;


  Song(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverUrl});

  static List<Song> songs = [
    Song(
        title: 'Hello',
        description: 'Adele',
        url: 'assets/music/Hello.mp3',
        coverUrl: 'https://bit.ly/3CXq1tS'),
   Song(
        title: 'Hello',
        description: 'Adele',
        url: 'assets/music/Hello.mp3',
        coverUrl: 'https://bit.ly/3CXq1tS'),
  Song(
        title: 'Rockstar',
        description: 'Burna Boy',
        url: 'assets/music/Hello.mp3',
        coverUrl: 'https://bit.ly/3CXq1tS'),
  Song(
        title: 'Rockstar',
        description: 'Burna Boy',
        url: 'assets/music/Hello.mp3',
        coverUrl: 'https://bit.ly/3CXq1tS'),
    // Song(
    //     title: 'Rockstar',
    //     description: 'Burna Boy',
    //     url: 'assets/music/Bandana.mp3',
    //     coverUrl: 'https://bit.ly/3CXq1tS'),
    // Song(
    //     title: 'Rockstar',
    //     description: 'Burna Boy',
    //     url: 'assets/music/Bandana.mp3',
    //     coverUrl: 'https://bit.ly/3CXq1tS'),
    // Song(
    //     title: 'Rockstar',
    //     description: 'Burna Boy',
    //     url: 'assets/music/Bandana.mp3',
    //     coverUrl: 'https://bit.ly/3CXq1tS'),
    // Song(
    //     title: 'Rockstar',
    //     description: 'Burna Boy',
    //     url: 'assets/music/Bandana.mp3',
    //     coverUrl: 'https://bit.ly/3CXq1tS'),
    // Song(
    //     title: 'Rockstar',
    //     description: 'Burna Boy',
    //     url: 'assets/music/Bandana.mp3',
    //     coverUrl: 'https://bit.ly/3CXq1tS'),
    // Song(
    //     title: 'Rockstar',
    //     description: 'Burna Boy',
    //     url: 'assets/music/Bandana.mp3',
    //     coverUrl: 'https://bit.ly/3CXq1tS'),
  ];
}
