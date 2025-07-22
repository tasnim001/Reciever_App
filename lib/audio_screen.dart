import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // Load your audio file (local asset)
    _player.setAsset('assets/sample.mp3');
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Audio Player")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<PlayerState>(
              stream: _player.playerStateStream,
              builder: (context, snapshot) {
                final playing = snapshot.data?.playing ?? false;
                return Text(
                  playing ? "Playing Audio" : "Paused",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  iconSize: 40,
                  onPressed: () => _player.play(),
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  iconSize: 40,
                  onPressed: () => _player.pause(),
                ),
                IconButton(
                  icon: Icon(Icons.forward_10),
                  iconSize: 40,
                  onPressed: () async {
                    final current = await _player.position;
                    _player.seek(current + Duration(seconds: 10));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
