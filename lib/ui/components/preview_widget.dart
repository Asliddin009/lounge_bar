import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PreviewWidget extends StatefulWidget {
  const PreviewWidget({super.key});

  @override
  State<PreviewWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/video/preview.mp4')
      ..initialize().then((_) async {
        await _controller.setVolume(0);
        _controller.play();
        _controller.setLooping(true);

        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width * 0.85,
        margin: const EdgeInsets.all(25),
        child: Stack(
          children: [
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  height: _controller.value.size.height,
                  width: _controller.value.size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: Text(
                'Lounge Bar',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
