import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team9_ud3_project/providers/peso_provider.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pesosProvider = Provider.of<PesoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'NUTRICIÓN',
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Image.asset(
              'assets/recetas/rslogo.png',
              height: 50,
              width: 110,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: (pesosProvider.msg == 'Normal')
                ? Image.asset('assets/nutricion/ntguxbien.png')
                : (pesosProvider.msg == 'Delgadez')
                    ? Image.asset('assets/nutricion/ntguxmedio.png')
                    : Image.asset('assets/nutricion/ntguxmal.png'),
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [
              (pesosProvider.msg == 'Normal')
                  ? Text(
                      '!FELICIDADES!',
                      style: GoogleFonts.quicksand(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      '¿Tu peso actual no es el adecuado?',
                      style: GoogleFonts.quicksand(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
              const SizedBox(
                height: 15,
              ),
              (pesosProvider.msg == 'Normal')
                  ? Text(
                      'Su estado nutricional es el indicado',
                      style: GoogleFonts.quicksand(fontSize: 17),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      '- Sigue diariamente nuestras recetas y los datos indicados en el gráfico circular durante 1 mes',
                      style: GoogleFonts.quicksand(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
              const SizedBox(
                height: 15,
              ),
              (pesosProvider.msg == 'Normal')
                  ? const Text(
                      '',
                    )
                  : Text(
                      '- Pasado este tiempo, colóquese sobre una balanza y actualice su perfil con los nuevos resultados',
                      style: GoogleFonts.quicksand(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
