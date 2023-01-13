import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team9_ud3_project/act_fisicas/pages/ejercicio_basico.dart';
import 'package:team9_ud3_project/act_fisicas/pages/ejercicio_experto.dart';
import 'package:team9_ud3_project/act_fisicas/pages/ejercicio_iniciante.dart';
import 'package:team9_ud3_project/act_fisicas/pages/ejercicio_promedio.dart';
import 'package:team9_ud3_project/widgets/loading_custom.dart';

class HacerEjercicio extends StatelessWidget {
  const HacerEjercicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 20, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    child: Image.asset(
                                        'assets/menuprincipal/bien/flecha_negra_volver.png'),
                                    onPressed: () {
                                      Navigator.pop(
                                        (context),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.046,
                              ),
                              Text(
                                "ACTIVIDADES FÍSICAS",
                                style: GoogleFonts.quicksand(
                                    fontSize: 12, fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/login/login_logo.png',
                        width: MediaQuery.of(context).size.width * 0.245,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.09,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ejercicios en casa",
                          style: GoogleFonts.quicksand(
                              fontSize: 24.5, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Por nivel",
                          style: GoogleFonts.quicksand(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 74, 178, 214),
                            Color.fromARGB(255, 152, 111, 175)
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(48, 0, 25, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/ejercicio/per1.png',
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Text(
                          "BÁSICO (INICIO)",
                          style: GoogleFonts.quicksand(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Image.asset(
                          'assets/ejercicio/derechablanca.png',
                          scale: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EjercicioIniciante()));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 239, 157, 195),
                            Color.fromARGB(255, 236, 90, 160),
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(48, 0, 25, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/ejercicio/per2.png',
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Text(
                          "PRINCIPIANTE",
                          style: GoogleFonts.quicksand(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Image.asset(
                          'assets/ejercicio/derechablanca.png',
                          scale: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EjercicioBasico()));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 51, 198, 244),
                            Color.fromARGB(255, 109, 150, 195),
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(48, 0, 25, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/ejercicio/per3.png',
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        Text(
                          "INTERMEDIO",
                          style: GoogleFonts.quicksand(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Image.asset(
                          'assets/ejercicio/derechablanca.png',
                          scale: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EjercicioPromedio()));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 51, 198, 244),
                            Color.fromARGB(255, 111, 194, 127)
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(48, 0, 25, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/ejercicio/per4.png',
                          width: MediaQuery.of(context).size.width * 0.13,
                        ),
                        Text(
                          "AVANZADO",
                          style: GoogleFonts.quicksand(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Image.asset(
                          'assets/ejercicio/derechablanca.png',
                          scale: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EjercicioExperto()));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              Image.asset(
                      'assets/ejercicio/guxejercicio.png',
                      scale: 4,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
