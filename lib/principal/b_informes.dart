import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Informes extends StatefulWidget {
  const Informes({super.key});

  @override
  State<Informes> createState() => _InformesState();
}

class _InformesState extends State<Informes> {
  @override
  Widget build(BuildContext context) {
    var cajainformes = 'assets/menuprincipal/bien/cajainformes.png';
    var cir_culos = 'assets/menuprincipal/otro/cir_culitos.png';

    var usuario = Text(
      'Nombre del Usuario',
      style: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white)),
    );

    var estado = Text(
      'ESTADO',
      style: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white)),
    );

    var edad = Text(
      '18',
      style: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              fontSize: 47, fontWeight: FontWeight.w400, color: Colors.white)),
    );

    var estatura = Text(
      '1.70',
      style: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              fontSize: 47, fontWeight: FontWeight.w400, color: Colors.white)),
    );

    var peso = Text(
      '60',
      style: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              fontSize: 47, fontWeight: FontWeight.w400, color: Colors.white)),
    );

    const genero = Text(
      'GÉNERO DEL USUARIO',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
    const vacunas = Text(
      'VAL. NUM',
      style: TextStyle(fontWeight: FontWeight.bold),
    );

    var colorbienverde = const Color.fromARGB(255, 111, 194, 127);
    var colorbienceleste = const Color.fromARGB(255, 51, 198, 244);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'INFORME',
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 116,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(cajainformes),
                fit: BoxFit.contain,
              )),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          usuario,
                          estado,
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 70,
                        width: 1,
                        color: Colors.white,
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                'EDAD',
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 28,
                                  ),
                                  edad,
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorbienverde,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 159,
                  height: 116,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'ESTATURA',
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            estatura,
                            Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'm',
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ]),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colorbienverde,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 159,
                  height: 116,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'PESO',
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            peso,
                            Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Kg',
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: colorbienceleste,
                borderRadius: BorderRadius.circular(5),
              ),
              width: double.infinity,
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'VACUNAS',
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white)),
                            ),
                            const SizedBox(height: 26,),
                            SizedBox(
                              width: 150,
                              child: Text(
                                '2/4',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 51,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                            ),
                            const SizedBox(height: 26,),
                          ],
                        ),
                        const SizedBox(width: 20,),
                        Image.asset(
                          cir_culos,
                          width: 100,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 231, 232),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 159,
                  height: 159,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 231, 232),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 159,
                  height: 159,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 231, 232),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 159,
                  height: 159,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 231, 232),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 159,
                  height: 159,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
