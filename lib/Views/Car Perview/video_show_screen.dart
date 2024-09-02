import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoShowScreen extends StatefulWidget {
  const VideoShowScreen({super.key});

  @override
  State<VideoShowScreen> createState() => _VideoShowScreenState();
}

class _VideoShowScreenState extends State<VideoShowScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '4jI85TLsIVM?si=YHUzrXPx38fjdCOh',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: false,
                progressIndicatorColor: Colors.red,
                progressColors: ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.red,
                ),
                onReady: () {
                  _controller.addListener(() {});
                },
              ),
              builder: (context, player) => player,
            ),
          ),
        ],
      ),
    );
  }
}
