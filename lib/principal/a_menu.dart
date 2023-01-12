import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/act_fisicas/pages/hacerejercicio.dart';
import 'package:team9_ud3_project/alergia/menualergias.dart';
import 'package:team9_ud3_project/model/usuarios_model.dart';
import 'package:team9_ud3_project/nutricion/nutripeso_home.dart';
import 'package:team9_ud3_project/preferences/logearse_preferences.dart';
import 'package:team9_ud3_project/providers/usuarios_provides.dart';
import 'package:team9_ud3_project/recetas_saludables/nutri_home.dart';
import 'package:team9_ud3_project/recomendaciones/recomendaciones.dart';
import 'package:team9_ud3_project/vacunas/pages/producto/productos_page.dart';
import 'package:video_player/video_player.dart';

class MenuPrincipalf extends StatefulWidget {
  const MenuPrincipalf({super.key});

  @override
  State<MenuPrincipalf> createState() => _MenuPrincipalfState();
}

class _MenuPrincipalfState extends State<MenuPrincipalf> {
  //REPRODUCIR VIDEO------------------------------------------------------------
  var videoPlayerControllera =
      VideoPlayerController.asset("assets/menuprincipal/bien/arobien.mp4");

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

  var logodeapp = 'assets/menuprincipal/otro/logodeapp.png';

  var iconobien = 'assets/menuprincipal/bien/check.png';
  var iconomedio = 'assets/menuprincipal/medio/circle.png';
  var iconomal = 'assets/menuprincipal/mal/bad.png';

  var cubitoverde = 'assets/menuprincipal/bien/cubitoverde.png';
  var cubitonaranja = 'assets/menuprincipal/medio/cubitonaranja.png';
  var cubitorojo = 'assets/menuprincipal/mal/cubitorojo.png';

  var slider1 = 'assets/menuprincipal/otro/slider1.png';

  var botonrecetas = 'assets/menuprincipal/otro/recetas.png';
  var botonejercicios = 'assets/menuprincipal/otro/actividades.png';
  var botonvacunas = 'assets/menuprincipal/otro/vacunas.png';
  var botonnutricion = 'assets/menuprincipal/otro/nutricion.png';
  var botonmedicacion = 'assets/menuprincipal/otro/medicacion.png';
  var botonalergias = 'assets/menuprincipal/otro/alergias.png';

  var colorbienverde = const Color.fromARGB(255, 111, 194, 127);
  var colorbienceleste = const Color.fromARGB(255, 51, 198, 244);
  var colormedionaranja = const Color.fromARGB(255, 252, 182, 71);
  var colormedioamarillo = const Color.fromARGB(255, 252, 207, 93);
  var colormalrojo = const Color.fromARGB(255, 237, 50, 55);
  var colormalnaranja = const Color.fromARGB(255, 248, 156, 50);

  @override
  Widget build(BuildContext context) {
    var usuario = Text(
      'Nombre del Usuario',
      style: GoogleFonts.quicksand(
          textStyle:
              const TextStyle(fontSize: 25.8, fontWeight: FontWeight.w800)),
    );
    var estado = Text(
      'ESTADO',
      style: GoogleFonts.quicksand(
          textStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    );
    final usuarioProdiver = Provider.of<UsuarioProvider>(context);
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
                    Image.asset(
                      logodeapp,
                      width: 85,
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
                          'Bienvenidos',
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.25,
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
                                            fontSize: 25.5,
                                            fontWeight: FontWeight.bold));
                                  },
                                );
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        ),
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
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(botonrecetas),
                          ),
                          MaterialButton(
                              height: 80,
                              minWidth: 195,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => NutriHome())));
                              })
                        ])),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: 105,
                        child: Stack(children: [
                          Image.asset(cubitoverde),
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Image.asset(botonejercicios),
                          ),
                          MaterialButton(
                              height: 80,
                              minWidth: 195,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HacerEjercicio()),
                                );
                              })
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
                            color: const Color.fromARGB(255, 230, 231, 232),
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
                                    color: Colors.black),
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
                          color: const Color.fromARGB(255, 230, 231, 232),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        height: 20,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 15),
                          child: Row(
                            children: [
                              Image.asset(slider1),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'EVALÚA TU IMC',
                                        style: GoogleFonts.quicksand(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 170,
                                        child: Text(
                                          'Presione para empezar el test de su Índice de Masa Corporal',
                                          style: GoogleFonts.quicksand(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: const Color.fromARGB(255, 230, 231, 232),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        height: 20,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 15),
                          child: Row(
                            children: [
                              Image.asset(slider1),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'EVALÚA TU IMC',
                                        style: GoogleFonts.quicksand(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 170,
                                        child: Text(
                                          'Presione para empezar el test de su Índice de Masa Corporal',
                                          style: GoogleFonts.quicksand(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: const Color.fromARGB(255, 230, 231, 232),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        height: 20,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 15),
                          child: Row(
                            children: [
                              Image.asset(slider1),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'EVALÚA TU IMC',
                                        style: GoogleFonts.quicksand(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 170,
                                        child: Text(
                                          'Presione para empezar el test de su Índice de Masa Corporal',
                                          style: GoogleFonts.quicksand(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
              height: 230,
              child: Column(
                children: [
                  //DIFERENCIA DE DIMENSIONES EN BOTONES B x H: 52
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 145,
                        height: 93,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(botonvacunas),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: MaterialButton(
                          // child: const Text(
                          //   'VACUNAS',
                          //   style: TextStyle(fontSize: 1),
                          // ),
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
                        width: 145,
                        height: 93,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(botonnutricion),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: MaterialButton(
                          // child: const Text(
                          //   'NUTRICIÓN',
                          //   style: TextStyle(fontSize: 1),
                          // ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => NutriPage())));
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
                        width: 145,
                        height: 93,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(botonmedicacion),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: MaterialButton(
                          // child: const Text(
                          //   'MEDICACIÓN',
                          //   style: TextStyle(fontSize: 1),
                          // ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 145,
                        height: 93,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(botonalergias),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: MaterialButton(
                          // child: const Text(
                          //   'ALERGIAS',
                          //   style: TextStyle(fontSize: 1),
                          // ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MenupageAlergia()));
                          },
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.white, width: 1),
                      //     color: Colors.transparent,
                      //     borderRadius: BorderRadius.circular(3),
                      //   ),
                      //   child: MaterialButton(
                      //     minWidth: 88,
                      //     height: 88,
                      //     child: const SizedBox(
                      //         width: 50,
                      //         child: Text(
                      //           'ACTIVIDADES FÍSICAS',
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(fontSize: 1),
                      //         )),
                      //     onPressed: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const HacerEjercicio()),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Row(
              children: [
                MaterialButton(
                  minWidth: 20,
                  height: 20,
                  color: Colors.lightGreen,
                  onPressed: (() {
                    setState(() {
                      iconobien = 'assets/menuprincipal/bien/check.png';
                      videoPlayerControllera = VideoPlayerController.asset(
                          "assets/menuprincipal/bien/arobien.mp4");
                      cubitoverde = 'assets/menuprincipal/bien/cubitoverde.png';
                      colorbienverde = const Color.fromARGB(255, 111, 194, 127);
                      colorbienceleste =
                          const Color.fromARGB(255, 51, 198, 244);
                    });
                  }),
                ),
                MaterialButton(
                  minWidth: 20,
                  height: 20,
                  color: Colors.orange,
                  onPressed: (() {
                    setState(() {
                      iconobien = iconomedio;

                      cubitoverde = cubitonaranja;
                      colorbienverde = colormedionaranja;
                      colorbienceleste = colormedioamarillo;
                    });
                  }),
                ),
                MaterialButton(
                  minWidth: 20,
                  height: 20,
                  color: Colors.red,
                  onPressed: (() {
                    setState(() {
                      iconobien = iconomal;
                      cubitoverde = cubitorojo;
                      colorbienverde = colormalrojo;
                      colorbienceleste = colormalnaranja;
                    });
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
