import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class LoadingCustom extends StatefulWidget {
  final String textoCarga;

  const LoadingCustom({super.key, required this.textoCarga});

  @override
  State<LoadingCustom> createState() => _LoadingCustomState();
}

class _LoadingCustomState extends State<LoadingCustom> {
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
        body: Column(
      children: [
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Un momento",
                style: GoogleFonts.quicksand(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.124,
                width: MediaQuery.of(context).size.width * 0.124,
                child: Chewie(
                  controller: chewieController!,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
        const Spacer(),
      ],
    ));
  }
}
