import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team9_ud3_project/model/usuarios_model.dart';
import 'package:team9_ud3_project/preferences/logearse_preferences.dart';
import 'package:team9_ud3_project/providers/usuarios_provides.dart';
import 'package:team9_ud3_project/recomendaciones/recomendaciones.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  //--Colores :3--
  var colorbienverde = const Color.fromARGB(255, 111, 194, 127);
  var colorbienceleste = const Color.fromARGB(255, 51, 198, 244);

  var colorazul = const Color.fromARGB(255, 109, 150, 195);
  var colorazulceleste = const Color.fromARGB(255, 51, 198, 244);

  var colormediogris = const Color.fromARGB(255, 230, 231, 232);

  //REPRODUCIR VIDEO------------------------------------------------------------
  var videoPlayerController =
      VideoPlayerController.asset("assets/menuprincipal/bien/arobien.mp4");

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
    final usuarioProdiver =
        Provider.of<UsuarioProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/login/login_logo.png',
                        width: MediaQuery.of(context).size.width * 0.245,
                        // fit: BoxFit.fill,
                        // isAntiAlias: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bienvenido",
                      style: GoogleFonts.quicksand(
                          fontSize: 15.092, fontWeight: FontWeight.w600),
                    ),
                    // Text(
                    //   usuarioProdiver.nombrelocal,
                    //   style: GoogleFonts.quicksand(
                    //       fontSize: 15.092, fontWeight: FontWeight.w600),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                      width: double.infinity,
                      child: FutureBuilder(
                        future: usuarioProdiver
                            .getusuario(Preferences.identificador),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List _snapshot = snapshot.data as List;
                            return ListView.builder(
                              itemCount: _snapshot.length,
                              itemBuilder: (context, index) {
                                Users usuarioss = _snapshot[index];
                                return Text(usuarioss.nombre,
                                    style: GoogleFonts.quicksand(
                                        fontSize: 20.5,
                                        fontWeight: FontWeight.bold));
                              },
                            );
                          }
                          return Text('-');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.585,
                        width: MediaQuery.of(context).size.width * 0.585,
                        child: Chewie(
                          controller: chewieController!,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.59,
                        width: MediaQuery.of(context).size.width * 0.59,
                        child: Center(
                          child: Text(
                            "ESTADO",
                            style: GoogleFonts.quicksand(
                                fontSize: 13.718, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.357,
                        child: Image.asset(
                          'assets/menuprincipal/bien/cuadro_derecha.png',
                          width: MediaQuery.of(context).size.width * 0.357,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.357,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "EDAD",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   usuarioProdiver.edadlocal,
                            //   style: GoogleFonts.quicksand(
                            //       fontSize: 46.656,
                            //       fontWeight: FontWeight.w500,
                            //       color: Colors.white),
                            //   textAlign: TextAlign.center,
                            //),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.125,
                              width: double.infinity,
                              child: FutureBuilder(
                                future: usuarioProdiver
                                    .getusuario(Preferences.identificador),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List _snapshot = snapshot.data as List;
                                    return ListView.builder(
                                      itemCount: _snapshot.length,
                                      itemBuilder: (context, index) {
                                        Users usuarioss = _snapshot[index];
                                        return Text(
                                          usuarioss.edad,
                                          style: GoogleFonts.quicksand(
                                              fontSize: 46.656,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        );
                                      },
                                    );
                                  }
                                  return Text('-');
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ESTATURA",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              usuarioProdiver.alturalocal,
                              style: GoogleFonts.quicksand(
                                  fontSize: 46.656,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            // SizedBox(
                            //   height:
                            //       MediaQuery.of(context).size.height * 0.125,
                            //   width: double.infinity,
                            //   child: FutureBuilder(
                            //     future: usuarioProdiver
                            //         .getusuario(Preferences.identificador),
                            //     builder: (context, snapshot) {
                            //       if (snapshot.hasData) {
                            //         List _snapshot = snapshot.data as List;
                            //         return ListView.builder(
                            //           itemCount: _snapshot.length,
                            //           itemBuilder: (context, index) {
                            //             Users usuarioss = _snapshot[index];
                            //             return Text(
                            //               usuarioss.altura,
                            //               style: GoogleFonts.quicksand(
                            //                   fontSize: 46.656,
                            //                   fontWeight: FontWeight.w500,
                            //                   color: Colors.white),
                            //               textAlign: TextAlign.center,
                            //             );
                            //           },
                            //         );
                            //       }
                            //       return Text('-');
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Recomendaciones()),
                          );
                        },
                        child: Text(
                          "Recomendaciones",
                          style: GoogleFonts.quicksand(
                              fontSize: 15.4,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.001,
            ),
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.3245,
                        width: MediaQuery.of(context).size.width * 0.88,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.zero, right: Radius.circular(5)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [colorazulceleste, colorazul])),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.3245,
                  child: Center(
                    child: CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.width * 0.23,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 600,
                          ),
                          autoPlayInterval: const Duration(seconds: 3),
                          viewportFraction: 0.9,
                        ),
                        items: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: colormediogris),
                          )
                        ]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PESO",
                              style: GoogleFonts.quicksand(
                                  fontSize: 12.673,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.35,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Chewie(
                                    controller: chewieController!,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.35,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(usuarioProdiver.pesolocal),
                                        /*
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: FutureBuilder(
                                            future: usuarioProdiver.getusuario(
                                                Preferences.identificador),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                List _snapshot =
                                                    snapshot.data as List;
                                                return ListView.builder(
                                                  itemCount: _snapshot.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    Users usuarioss =
                                                        _snapshot[index];
                                                    return Text(
                                                      usuarioss.peso,
                                                      style:
                                                          GoogleFonts.quicksand(
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                      //height: 0.97),
                                                      textAlign:
                                                          TextAlign.center,
                                                    );
                                                  },
                                                );
                                              }
                                              return Text('-');
                                            },
                                          ),
                                        ),*/
                                        Text(
                                          "kg",
                                          style: GoogleFonts.quicksand(
                                              fontSize: 16.243,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.width * 0.43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: colormediogris),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "TIPO DE SANGRE",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 12.673,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          'assets/menuprincipal/bien/gotadesangre.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.115,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width *
                                        0.27,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          usuarioProdiver.tipo_sangrelocal,
                                          style: GoogleFonts.quicksand(
                                              fontSize: 31.575,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
