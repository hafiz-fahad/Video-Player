// @dart=2.9
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class CelebrityVideoScreen extends StatefulWidget {
  @override
  _CelebrityVideoScreenState createState() => _CelebrityVideoScreenState();
}

class _CelebrityVideoScreenState extends State<CelebrityVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: VideoItems(
              looping: false,
              autoPlay: true,
              videoPlayerController: VideoPlayerController.network(
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
              )),
        ),
      ),
    );
  }
}

class VideoItems extends StatefulWidget {
  const VideoItems({
    @required this.videoPlayerController,
    this.looping,
    this.autoPlay,
  });
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoPlay;

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  ChewieController chewController;

  @override
  void initState() {
    super.initState();
    chewController = ChewieController(
      deviceOrientationsOnEnterFullScreen: <DeviceOrientation>[
        DeviceOrientation.portraitUp
      ],
      deviceOrientationsAfterFullScreen: <DeviceOrientation>[
        DeviceOrientation.portraitUp
      ],
      videoPlayerController: widget.videoPlayerController,
      // aspectRatio: 1 / 1.9,
      autoInitialize: true,
      showControls: true,
      allowMuting: true,
      allowPlaybackSpeedChanging: true,

      allowFullScreen: true,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      errorBuilder: (BuildContext context, String errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    chewController.dispose();
    widget.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewController,
    );
  }
}
