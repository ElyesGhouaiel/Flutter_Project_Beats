import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  String? _error;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Écouteurs pour les changements de durée et de position
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    _audioPlayer.onAudioPositionChanged.listen((Duration position) {
      setState(() {
        _currentPosition = position;
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.PLAYING) {
        setState(() {
          _isPlaying = true;
        });
      } else if (state == PlayerState.PAUSED) {
        setState(() {
          _isPlaying = false;
        });
      } else if (state == PlayerState.STOPPED) {
        setState(() {
          _isPlaying = false;
          _currentPosition = Duration.zero;
        });
      }
    });

    _audioPlayer.onPlayerError.listen((String message) {
      setState(() {
        _error = message;
      });
    });

    _playAudio();
  }

  void _playAudio() async {
    try {
      await _audioPlayer.play(widget.audioUrl);
    } catch (e) {
      setState(() {
        _error = 'Failed to load audio: $e';
      });
    }
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(widget.audioUrl);
    }
  }

  void _stop() {
    _audioPlayer.stop();
  }

  void _seek(double value) {
    final position = Duration(milliseconds: value.toInt());
    if (position <= _totalDuration) {
      _audioPlayer.seek(position);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
            if (_error != null)
              Text(
                'Error: $_error',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.stop),
                  color: Color(0xFFB9848C),
                  onPressed: _stop,
                ),
                IconButton(
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  color: Color(0xFFB9848C),
                  onPressed: _togglePlayPause,
                ),
              ],
            ),
            SizedBox(height: 20),
            Slider(
              value: _totalDuration.inMilliseconds > 0
                  ? _currentPosition.inMilliseconds.toDouble()
                  : 0.0,
              min: 0.0,
              max: _totalDuration.inMilliseconds.toDouble(),
              onChanged: _seek,
              activeColor: Color(0xFFB9848C),
              inactiveColor: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _formatDuration(_currentPosition),
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  _formatDuration(_totalDuration),
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
