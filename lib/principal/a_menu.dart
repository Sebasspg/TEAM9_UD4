import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team9_ud3_project/act_fisicas/pages/hacerejercicio.dart';
import 'package:team9_ud3_project/alergias/menualergias.dart';
import 'package:team9_ud3_project/medicacion/pages/menumedicacion_pages.dart';
import 'package:team9_ud3_project/nutricion/nutripeso_home.dart';
import 'package:team9_ud3_project/recetas_saludables/nutri_home.dart';
import 'package:team9_ud3_project/recomendaciones/recomendaciones.dart';
import 'package:team9_ud3_project/vacunas/pages/producto/productos_page.dart';
import 'package:video_player/video_player.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  //REPRODUCIR VIDEO------------------------------------------------------------
  var videoPlayerControllera =
      VideoPlayerController.asset("assets/menuprincipal/bien/arobien.mp4");

  var videoPlayerControllerb =
      VideoPlayerController.asset("assets/menuprincipal/medio/aromedio.mp4");

  var videoPlayerControllerc =
      VideoPlayerController.asset("assets/menuprincipal/mal/aromal.mp4");

  ChewieController? chewieControllera;
  @override
  void initState() {
    chewieControllera = ChewieController(
        videoPlayerController: videoPlayerControllera,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
        showControls: false,
        aspectRatio: 1 / 1);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerControllera.dispose();
    chewieControllera!.dispose();
    super.dispose();
  }
  //----------------------------------------------------------------------------

  var iconobien = 'assets/menuprincipal/bien/check.png';
  var iconomedio = 'assets/menuprincipal/medio/circle.png';
  var iconomal = 'assets/menuprincipal/mal/bad.png';

  var cubitoverde = 'assets/menuprincipal/bien/cubitoverde.png';
  var cubitonaranja = 'assets/menuprincipal/medio/cubitonaranja.png';
  var cubitorojo = 'assets/menuprincipal/mal/cubitorojo.png';

  var colorbienverde = const Color.fromARGB(255, 111, 194, 127);
  var colorbienceleste = const Color.fromARGB(255, 51, 198, 244);
  var colormedionaranja = const Color.fromARGB(255, 252, 182, 71);
  var colormedioamarillo = const Color.fromARGB(255, 239, 235, 103);
  var colormalrojo = const Color.fromARGB(255, 237, 50, 55);
  var colormalnaranja = const Color.fromARGB(255, 248, 156, 50);

  @override
  Widget build(BuildContext context) {
    var usuario = Text(
      'Nombre del Usuario',
      style: GoogleFonts.quicksand(
          textStyle:
              const TextStyle(fontSize: 25.5, fontWeight: FontWeight.w800)),
    );
    var estado = Text(
      'ESTADO',
      style: GoogleFonts.quicksand(
          textStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),

//CUERPO------------------------------------------------------------------------

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nombre de App',
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bienvenido',
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                        usuario,
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                          width: 33,
                          child: Stack(children: [Image.asset(iconobien)])),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 195,
                      width: 195,
                      child: Chewie(
                        controller: chewieControllera!,
                      ),
                    ),
                    SizedBox(
                      height: 195,
                      width: 195,
                      child: Center(child: estado),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: 105,
                        child: Stack(children: [
                          Image.asset(cubitoverde),
                        ])),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: 105,
                        child: Stack(children: [
                          Image.asset(cubitoverde),
                        ])),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: colorbienverde),
              height: 125,
              width: double.infinity,
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'RECOMENDACIONES',
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          height: 20,
                          width: 90,
                          child: MaterialButton(
                              child: Text(
                                'Ver todo',
                                style: GoogleFonts.quicksand(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Recomendaciones()),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 70,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(
                        seconds: 1,
                      ),
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 0.9,
                    ),
                    items: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        height: 20,
                        width: double.infinity,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        height: 20,
                        width: double.infinity,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        height: 20,
                        width: double.infinity,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: colorbienceleste),
              width: double.infinity,
              height: 245,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: MaterialButton(
                          minWidth: 88,
                          height: 88,
                          child: const Text(
                            'VACUNAS',
                            style: TextStyle(fontSize: 1),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductosPage()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: MaterialButton(
                          minWidth: 88,
                          height: 88,
                          child: const Text(
                            'NUTRICIÓN',
                            style: TextStyle(fontSize: 1),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => NutriPage())));
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: MaterialButton(
                          minWidth: 88,
                          height: 88,
                          child: const SizedBox(
                              width: 50,
                              child: Text(
                                'RECETAS SALUDABLES',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 1),
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => NutriHome())));
                          },
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: MaterialButton(
                          minWidth: 88,
                          height: 88,
                          child: const Text(
                            'ALERGIAS',
                            style: TextStyle(fontSize: 1),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MenupageAlergia()));
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: MaterialButton(
                          minWidth: 88,
                          height: 88,
                          child: const SizedBox(
                              width: 50,
                              child: Text(
                                'ACTIVIDADES FÍSICAS',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 1),
                              )),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HacerEjercicio()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: MaterialButton(
                          minWidth: 88,
                          height: 88,
                          child: const SizedBox(
                              width: 50,
                              child: Text(
                                'MEDICACIÓN',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 1),
                              )),
                          onPressed: () {
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MenupageMedicina()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            MaterialButton(
                onPressed: (() {
                  setState(() {
                    iconobien = 'assets/menuprincipal/bien/check.png';
                    videoPlayerControllera = VideoPlayerController.asset(
                        "assets/menuprincipal/bien/arobien.mp4");
                    cubitoverde = 'assets/menuprincipal/bien/cubitoverde.png';
                    colorbienverde = const Color.fromARGB(255, 111, 194, 127);
                    colorbienceleste = const Color.fromARGB(255, 51, 198, 244);
                  });
                }),
                child: const Text('VERDE')),
            MaterialButton(
                onPressed: (() {
                  setState(() {
                    iconobien = iconomedio;
                    videoPlayerControllera = videoPlayerControllerb;
                    cubitoverde = cubitonaranja;
                    colorbienverde = colormedionaranja;
                    colorbienceleste = colormedioamarillo;
                  });
                }),
                child: const Text('NARANJA')),
            MaterialButton(
                onPressed: (() {
                  setState(() {
                    iconobien = iconomal;
                    videoPlayerControllera = videoPlayerControllerc;
                    cubitoverde = cubitorojo;
                    colorbienverde = colormalrojo;
                    colorbienceleste = colormalnaranja;
                  });
                }),
                child: const Text('ROJO')),
          ],
        ),
      ),
    );
  }
}
