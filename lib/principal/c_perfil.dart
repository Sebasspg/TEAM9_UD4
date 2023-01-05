import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/principal/nosotros.dart';
import 'package:team9_ud3_project/providers/logearse_providers.dart';

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
    final authService = Provider.of<AuthService>(context, listen: false);
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
                              onPressed: () {
                                authService.cerrarSesion();
                                Navigator.pushNamed(context, '/signin');
                              }),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                      value: estaactivo,
                      onChanged: (value) {
                        setState(() {
                          estaactivo = value;
                        });
                      },
                      activeTrackColor: Colors.lightGreen,
                      activeColor: const Color.fromARGB(255, 111, 194, 127),
                    ),
                    const Spacer(),
                    Text(
                      'TEMA: OSCURO',
                      style: GoogleFonts.quicksand(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/menuprincipal/otro/logodeapp.png',
                      width: 90,
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'DESARROLLADO POR',
                          style: GoogleFonts.quicksand(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              'assets/menuprincipal/otro/logodeempresa.png',
                              width: 110,
                            ),
                            MaterialButton(
                                minWidth: 110,
                                height: 50,
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              NosotrosPage())));
                                }))
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
