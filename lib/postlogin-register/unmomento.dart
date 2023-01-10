import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class UnMomento extends StatefulWidget {
  const UnMomento({super.key});

  @override
  State<UnMomento> createState() => _UnMomentoState();
}

class _UnMomentoState extends State<UnMomento> {
  //REPRODUCIR VIDEO------------------------------------------------------------
  var videoPlayerController =
      VideoPlayerController.asset("assets/postlogin/circulo_carga.mp4");

  ChewieController? chewieController;
  @override
  void initState() {
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
        showControls: false,
        aspectRatio: 1 / 1);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  //----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/login/login_logo.png',
                      width: MediaQuery.of(context).size.width * 0.245,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Un momento...",
                      style: GoogleFonts.quicksand(
                          fontSize: 22.5, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Gux está preparando todo para tí",
                      style: GoogleFonts.quicksand(
                          fontSize: 14.05, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.043,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.124,
              width: MediaQuery.of(context).size.width * 0.124,
              child: Chewie(
                controller: chewieController!,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/postlogin/gux_limpiando.png',
                    width: MediaQuery.of(context).size.width * 0.57,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
