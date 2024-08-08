import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class SongDetailPage extends StatefulWidget {
  final String title;
  final String artist;
  final String image;
  final String audioUrl;

  SongDetailPage({
    required this.title,
    required this.artist,
    required this.image,
    required this.audioUrl,
  });

  @override
  _SongDetailPageState createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  late AudioPlayer _audioPlayer;
  late ConcatenatingAudioSource _playlist;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playlist = ConcatenatingAudioSource(
      children: [
        AudioSource.uri(Uri.parse(widget.audioUrl)),
      ],
    );
    _audioPlayer.setAudioSource(_playlist);
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _position = position;
      });
    });
    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _duration = duration ?? Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _stop() {
    _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  void _seekTo(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                widget.image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.artist,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Here you can add more details about the song, such as the album, release date, or a brief description.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20),
            // Audio player controls
            Column(
              children: [
                Slider(
                  value: _position.inSeconds.toDouble(),
                  max: _duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    _seekTo(Duration(seconds: value.toInt()));
                  },
                  inactiveColor: Colors.grey,
                  activeColor: Color(0xFFB9848C),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous),
                      onPressed: () {
                        // Handle skip previous
                      },
                    ),
                    IconButton(
                      icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: _playPause,
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next),
                      onPressed: () {
                        // Handle skip next
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.stop),
                      onPressed: _stop,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
