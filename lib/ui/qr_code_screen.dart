import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loung_bar/ui/components/base_elevated_button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/video/smoke2.mp4')
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
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
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
            Image.asset(
              'assets/images/back.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              opacity: const AlwaysStoppedAnimation<double>(0.3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 62, horizontal: 16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Lounge-Bar',
                      style: GoogleFonts.notoSerifAhom(
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    BaseElevatedButton(
                      text: "Забронировать столик",
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (context) => Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Контакты:',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  child: SelectableText(
                                    '+7 991 819 70-71',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                    onPressed: () async {
                                      const url = 'tel:+79918197071';
                                      if (await canLaunchUrlString(url)) {
                                        await launchUrlString(url);
                                      }
                                    },
                                    child: const Text('Забронировать'))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BaseElevatedButton(
                      text: "Меню",
                      onPressed: () {
                        context.go('/menu');
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BaseElevatedButton(
                      text: "Наш сайт",
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
