class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      title: 'For Revenge',
      description: 'Serana',
      url: 'assets/music/serana.mp3',
      coverUrl: 'assets/images/serana.jpg',
    ),
    Song(
      title: 'Last Child',
      description: 'Duka',
      url: 'assets/music/illusions.mp3',
      coverUrl: 'assets/images/duka.jpg',
    ),
    Song(
      title: 'Mahalini',
      description: 'Pray',
      url: 'assets/music/pray.mp3',
      coverUrl: 'assets/images/mahalini.jpg',
    )
  ];
}
