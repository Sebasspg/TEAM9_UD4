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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UnMomento()));
                unmomentotiempo();
              },
              child: Text('SKIP')),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _controller,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage('assets/nutricion/guxcarrusel.png'),
                ),
              ),
              child: Text(
                'Para continuar necesitos tus datos personales',
                style: GoogleFonts.quicksand(color: Colors.black, fontSize: 45),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(color: Colors.blue, child: CarruselEditar()),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => _controller.jumpToPage(2),
              child: Text('PREVIEW'),
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
              child: Text('NEXT'),
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
