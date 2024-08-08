import 'package:flutter/material.dart';
import 'song_detail_page.dart';

class PlaylistPage extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "image": "assets/blinding_lights.jpg",
      "audio": "assets/audio/blinding_lights.mp3",
    },
    {
      "title": "Shape of You",
      "artist": "Ed Sheeran",
      "image": "assets/shape_of_you.jpg",
      "audio": "assets/audio/shape_of_you.mp3",
    },
    {
      "title": "Uptown Funk",
      "artist": "Mark Ronson ft. Bruno Mars",
      "image": "assets/uptown_funk.jpg",
      "audio": "assets/audio/uptown_funk.mp3",
    },
    {
      "title": "Levitating",
      "artist": "Dua Lipa",
      "image": "assets/levitating.jpg",
      "audio": "assets/audio/levitating.mp3",
    },
    {
      "title": "Watermelon Sugar",
      "artist": "Harry Styles",
      "image": "assets/watermelon_sugar.jpg",
      "audio": "assets/audio/watermelon_sugar.mp3",
    },
    {
      "title": "Bad Guy",
      "artist": "Billie Eilish",
      "image": "assets/bad_guy.jpg",
      "audio": "assets/audio/bad_guy.mp3",
    },
    {
      "title": "Old Town Road",
      "artist": "Lil Nas X",
      "image": "assets/old_town_road.jpg",
      "audio": "assets/audio/old_town_road.mp3",
    },
    {
      "title": "Don’t Start Now",
      "artist": "Dua Lipa",
      "image": "assets/dont_start_now.jpg",
      "audio": "assets/audio/dont_start_now.mp3",
    },
    {
      "title": "Dance Monkey",
      "artist": "Tones and I",
      "image": "assets/dance_monkey.jpg",
      "audio": "assets/audio/dance_monkey.mp3",
    },
    {
      "title": "Rockstar",
      "artist": "DaBaby ft. Roddy Ricch",
      "image": "assets/rockstar.jpg",
      "audio": "assets/audio/rockstar.mp3",
    },
    {
      "title": "Someone You Loved",
      "artist": "Lewis Capaldi",
      "image": "assets/someone_you_loved.jpg",
      "audio": "assets/audio/someone_you_loved.mp3",
    },
    {
      "title": "Happier",
      "artist": "Marshmello ft. Bastille",
      "image": "assets/happier.jpg",
      "audio": "assets/audio/happier.mp3",
    },
    {
      "title": "Sunflower",
      "artist": "Post Malone & Swae Lee",
      "image": "assets/sunflower.jpg",
      "audio": "assets/audio/sunflower.mp3",
    },
    {
      "title": "Shallow",
      "artist": "Lady Gaga & Bradley Cooper",
      "image": "assets/shallow.jpg",
      "audio": "assets/audio/shallow.mp3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Playlist',
          style: TextStyle(
              fontFamily: 'FiraSans'), // Appliquer Fira Sans pour le titre
        ),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              songs[index]['image']!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(
              songs[index]['title']!,
              style: TextStyle(
                fontFamily:
                    'FiraSans', // Appliquer Fira Sans pour le titre de la chanson
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              songs[index]['artist']!,
              style: TextStyle(
                fontFamily: 'Numans', // Appliquer Numans pour l'artiste
                color: Color(0xFF806491),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongDetailPage(
                    title: songs[index]['title']!,
                    artist: songs[index]['artist']!,
                    image: songs[index]['image']!,
                    audioUrl: songs[index]['audio']!, // Passez l'URL de l'audio
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
