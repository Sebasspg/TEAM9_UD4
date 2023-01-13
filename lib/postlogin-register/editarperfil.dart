import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:team9_ud3_project/postlogin-register/unmomento.dart';
import 'package:team9_ud3_project/principal/controlador_principal.dart';
import 'package:team9_ud3_project/widgets/customTexts.dart';

class EditarPerfilInicial extends StatefulWidget {
  const EditarPerfilInicial({super.key});

  @override
  State<EditarPerfilInicial> createState() => _EditarPerfilInicialState();
}

class _EditarPerfilInicialState extends State<EditarPerfilInicial> {
  final _controller = PageController();

  void unmomentotiempo() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ControladorPrincipal()),
      );
      // Navigator.of(context).pushNamedAndRemoveUntil(
      //     '/unmomento', (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _controller,
          children: [
            Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
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
                              // fit: BoxFit.fill,
                              // isAntiAlias: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(flex: 2,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Gux necesita unos datos para comenzar',
                        style: GoogleFonts.quicksand(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
                    Image.asset('assets/nutricion/guxcarrusel.png', width: MediaQuery.of(context).size.width * 0.7,),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            CarruselEditar(),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 45),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => _controller.jumpToPage(2),
              child: Text(
                'ANTERIOR',
                style: GoogleFonts.quicksand(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
              ),
            ),
            TextButton(
              onPressed: () => _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut),
              child: Text(
                'SIGUIENTE',
                style: GoogleFonts.quicksand(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



        // child: MaterialButton(
        //     child: Text("CONTINUAR"),
        //     onPressed: (() {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => UnMomento()),
        //       );
        //       unmomentotiempo();
        //     })),
