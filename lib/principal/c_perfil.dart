import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    var cajaperfil = 'assets/menuprincipal/bien/cajaperfil.png';

    var usuario = Text(
      'Nombre del Usuario',
      style: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              fontSize: 21, fontWeight: FontWeight.w800, color: Colors.white)),
    );

    bool estaactivo = false;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 355,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(cajaperfil),
                fit: BoxFit.contain,
              )),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'PERFIL',
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 230, 231, 232),
                      radius: 81,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    usuario,
                    const Spacer(
                      flex: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          height: 35,
                          width: 140,
                          child: MaterialButton(
                              child: Text(
                                'EDITAR PERFIL',
                                style: GoogleFonts.quicksand(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              onPressed: () {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 231, 232),
                borderRadius: BorderRadius.circular(5),
              ),
              width: double.infinity,
              height: 60,
              child: Row(
                children: [
                  Switch(
                    value: estaactivo,
                    onChanged: (value) {
                      setState(() {
                        estaactivo = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
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
