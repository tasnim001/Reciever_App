import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // You can use a local asset or a network video
    _controller = VideoPlayerController.asset('assets/sample.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Column(
        children: [
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          else
            Center(child: CircularProgressIndicator()),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () => _controller.play(),
              ),
              IconButton(
                icon: Icon(Icons.pause),
                onPressed: () => _controller.pause(),
              ),
              IconButton(
                icon: Icon(Icons.forward_10),
                onPressed: () {
                  final newPosition =
                      _controller.value.position + Duration(seconds: 10);
                  _controller.seekTo(newPosition);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
