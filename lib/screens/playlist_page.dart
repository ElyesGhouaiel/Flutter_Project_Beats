import 'package:flutter/material.dart';
import 'song_detail_page.dart';

class PlaylistPage extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "image": "assets/blinding_lights.jpg"
    },
    {
      "title": "Shape of You",
      "artist": "Ed Sheeran",
      "image": "assets/shape_of_you.jpg"
    },
    {
      "title": "Uptown Funk",
      "artist": "Mark Ronson ft. Bruno Mars",
      "image": "assets/uptown_funk.jpg"
    },
    {
      "title": "Levitating",
      "artist": "Dua Lipa",
      "image": "assets/levitating.jpg"
    },
    {
      "title": "Watermelon Sugar",
      "artist": "Harry Styles",
      "image": "assets/watermelon_sugar.jpg"
    },
    {
      "title": "Bad Guy",
      "artist": "Billie Eilish",
      "image": "assets/bad_guy.jpg"
    },
    {
      "title": "Old Town Road",
      "artist": "Lil Nas X",
      "image": "assets/old_town_road.jpg"
    },
    {
      "title": "Don’t Start Now",
      "artist": "Dua Lipa",
      "image": "assets/dont_start_now.jpg"
    },
    {
      "title": "Dance Monkey",
      "artist": "Tones and I",
      "image": "assets/dance_monkey.jpg"
    },
    {
      "title": "Rockstar",
      "artist": "DaBaby ft. Roddy Ricch",
      "image": "assets/rockstar.jpg"
    },
    {
      "title": "Someone You Loved",
      "artist": "Lewis Capaldi",
      "image": "assets/someone_you_loved.jpg"
    },
    {
      "title": "Happier",
      "artist": "Marshmello ft. Bastille",
      "image": "assets/happier.jpg"
    },
    {
      "title": "Sunflower",
      "artist": "Post Malone & Swae Lee",
      "image": "assets/sunflower.jpg"
    },
    {
      "title": "Shallow",
      "artist": "Lady Gaga & Bradley Cooper",
      "image": "assets/shallow.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
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
              style:
                  Theme.of(context).textTheme.bodyLarge, // Utilisez bodyLarge
            ),
            subtitle: Text(
              songs[index]['artist']!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Color(0xFF806491)), // Utilisez bodyMedium
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongDetailPage(
                    title: songs[index]['title']!,
                    artist: songs[index]['artist']!,
                    image: songs[index]['image']!,
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
