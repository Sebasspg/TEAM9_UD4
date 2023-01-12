import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/act_fisicas/pages/hacerejercicio.dart';
import 'package:team9_ud3_project/alergia/menualergias.dart';
import 'package:team9_ud3_project/medicacion/pages/menumedicacion_pages.dart';
import 'package:team9_ud3_project/nutricion/nutri_main.dart';
import 'package:team9_ud3_project/nutricion/nutripeso_home.dart';
import 'package:team9_ud3_project/providers/usuarios_provides.dart';
import 'package:team9_ud3_project/providers/vacuna_provider.dart';
import 'package:team9_ud3_project/recetas_saludables/nutri_home.dart';
import 'package:team9_ud3_project/vacunas/pages/producto/productos_page.dart';
import 'package:team9_ud3_project/vacunas/pages/producto/read_vacuna.dart';
import 'package:video_player/video_player.dart';

class PanelPrincipal extends StatefulWidget {
  const PanelPrincipal({super.key});

  @override
  State<PanelPrincipal> createState() => _PanelPrincipalState();
}

class _PanelPrincipalState extends State<PanelPrincipal> {
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
    final vacunasProvider = Provider.of<VacunasProvider>(context);
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
              height: MediaQuery.of(context).size.width * 0.085,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "Todo listo para tí",
                      style: GoogleFonts.quicksand(
                        fontSize: 24.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Image.asset(
                      'assets/login/login_corazon.png',
                      scale: 7,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.087,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 17, 0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/menuprincipal/bien/triangulo_izquierda.png',
                      width: MediaQuery.of(context).size.width * 0.205,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.696,
                      height: MediaQuery.of(context).size.width * 0.619,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.width * 0.3,
                                    width: MediaQuery.of(context).size.width *
                                        0.337,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              colorbienverde,
                                              colorbienceleste
                                            ])),
                                    child: Image.asset(
                                      'assets/menuprincipal/bien/boton_recetas.png',
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * 0.3,
                                    width: MediaQuery.of(context).size.width *
                                        0.337,
                                    child: MaterialButton(
                                      onPressed: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    NutriHome())));
                                      }),
                                    ),
                                  )
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.width * 0.3,
                                    width: MediaQuery.of(context).size.width *
                                        0.337,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              colorbienverde,
                                              colorbienceleste
                                            ])),
                                    child: Image.asset(
                                      'assets/menuprincipal/bien/boton_ejercicios.png',
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * 0.3,
                                    width: MediaQuery.of(context).size.width *
                                        0.337,
                                    child: MaterialButton(
                                      onPressed: (() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HacerEjercicio()),
                                        );
                                      }),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.28,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [colorazul, colorazulceleste])),
                                child: Image.asset(
                                  'assets/menuprincipal/bien/boton_nutrición.png',
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.28,
                                width: MediaQuery.of(context).size.width,
                                child: MaterialButton(
                                  onPressed: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                NutriMain())));
                                  }),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.044,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 22, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.19,
                        width: MediaQuery.of(context).size.width * 0.65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: colormediogris),
                        child: Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 26),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mis Vacunas",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15.3,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Image.asset(
                                      'assets/menuprincipal/bien/flecha_gris.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.19,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: MaterialButton(
                                onPressed: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VacunaTest()),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Chewie(
                              controller: chewieController!,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(
                              child: Text(
                                "${vacunasProvider.contadorVacuna}",
                                style: GoogleFonts.quicksand(
                                  fontSize: 33,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.027,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.19,
                        width: MediaQuery.of(context).size.width * 0.65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: colormediogris),
                        child: Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 26),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mis Medicinas",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15.3,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Image.asset(
                                      'assets/menuprincipal/bien/flecha_gris.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.19,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: MaterialButton(
                                onPressed: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MenupageMedicina()),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Chewie(
                              controller: chewieController!,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(
                              child: Text(
                                "0",
                                style: GoogleFonts.quicksand(
                                  fontSize: 33,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.027,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.19,
                        width: MediaQuery.of(context).size.width * 0.65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: colormediogris),
                        child: Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 26),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mis Alergias",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15.3,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Image.asset(
                                      'assets/menuprincipal/bien/flecha_gris.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.19,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: MaterialButton(
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MenupageAlergia()));
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Chewie(
                              controller: chewieController!,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(
                              child: Text(
                                "0",
                                style: GoogleFonts.quicksand(
                                  fontSize: 33,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.035,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "COMPATIBILIDAD SANGUÍNEA",
                      style: GoogleFonts.quicksand(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.035,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.16,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 166, 170)),
                      child: MaterialButton(
                          child: Text(
                            "AB+",
                            style: GoogleFonts.quicksand(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.027,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.16,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: colormediogris),
                      child: MaterialButton(
                          child: Text(
                            "A+",
                            style: GoogleFonts.quicksand(
                                fontSize: 17.5, fontWeight: FontWeight.w800),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.027,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.16,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: colormediogris),
                      child: MaterialButton(
                          child: Text(
                            "A-",
                            style: GoogleFonts.quicksand(
                                fontSize: 17.5, fontWeight: FontWeight.w800),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.027,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.16,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: colormediogris),
                      child: MaterialButton(
                          child: Text(
                            "B+",
                            style: GoogleFonts.quicksand(
                                fontSize: 17.5, fontWeight: FontWeight.w800),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.027,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.16,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: colormediogris),
                      child: MaterialButton(
                          child: Text(
                            "B-",
                            style: GoogleFonts.quicksand(
                                fontSize: 17.5, fontWeight: FontWeight.w800),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.027,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.16,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: colormediogris),
                      child: MaterialButton(
                          child: Text(
                            "AB+",
                            style: GoogleFonts.quicksand(
                                fontSize: 17.5, fontWeight: FontWeight.w800),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.027,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.16,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: colormediogris),
                      child: MaterialButton(
                          child: Text(
                            "AB-",
                            style: GoogleFonts.quicksand(
                                fontSize: 17.5, fontWeight: FontWeight.w800),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.027,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.16,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: colormediogris),
                      child: MaterialButton(
                          child: Text(
                            "o+",
                            style: GoogleFonts.quicksand(
                                fontSize: 17.5, fontWeight: FontWeight.w800),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.027,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.16,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: colormediogris),
                      child: MaterialButton(
                          child: Text(
                            "o-",
                            style: GoogleFonts.quicksand(
                                fontSize: 17.5, fontWeight: FontWeight.w800),
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
