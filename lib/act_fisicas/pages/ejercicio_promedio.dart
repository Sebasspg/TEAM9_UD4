import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/act_fisicas/widgets/plantillaparatarea.dart';
import 'package:team9_ud3_project/providers/launcher_provider.dart';

import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class EjercicioPromedio extends StatefulWidget {
  const EjercicioPromedio({super.key});

  @override
  State<EjercicioPromedio> createState() => _EjercicioPromedioState();
}

class _EjercicioPromedioState extends State<EjercicioPromedio> {
  late Controller controller;
  final List<dynamic> data = [
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz1iNzQxMDQwNjY2MjFmODZlMGQxOTM0MjRkY2JjMjlkYQ==',
      'title': 'ELEVACIONES DE RODILLA',
      'subtitle':
          'Párate con los pies separados al ancho de tus caderas. Levanta una rodilla hacia el pecho y luego haz lo mismo con la otra. Continúa el movimiento alternando las piernas.',
      'repetir': '30'
    },
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz04NmJhY2U1YjE2OGQxYjk4NDU0OWZiN2NlODY3Y2JhMQ==',
      'title': 'BURPEES',
      'subtitle':
          'Párate con los pies paralelos y, luego, flexiona las rodillas y baja la cadera hacia el suelo, como si fueras a sentarte. Mantén el pecho elevado y la mirada hacia delante. La espalda debe permanecer lo más recta posible.',
      'repetir': '15'
    },
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz1jMjkzOTgzYzBjNjQ2ZjljMzc2MzI0ZWQwYTIyMzcyZg==',
      'title': 'FONDOS DE TRÍCEPS',
      'subtitle':
          'Apoya las manos sobre el asiento, con los dedos apuntando hacia delante y los brazos extendidos. La espalda tiene que estar erguida y el abdomen contraído. Baja la parte superior del cuerpo, flexionando los codos hasta que los glúteos casi toquen el suelo. A continuación, vuelve a la posición inicial.',
      'repetir': '15'
    },
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz1iMDEyZDVkZmIyNDAzZmJmZjliMDYxNThhOWExZTgzOA==',
      'title': 'SALTOS',
      'subtitle':
          'Puedes hacer diferentes tipos de saltos. En los saltos en estrella, por ejemplo, te impulsas hacia arriba mientras alejas los brazos y piernas del cuerpo. También puedes probar los saltos con rodillas al pecho, subiendo las dos piernas lo más alto posible.',
      'repetir': '25'
    },
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz01ZDY2ZGM3MDUwYjU5YTEzNGMzMTY1MjhhNTYxNDUwYg==',
      'title': 'TABLAS',
      'subtitle':
          'Ubícate boca abajo, apoya las manos al ancho de hombros y estira los brazos. Las piernas deben estar rectas, el abdomen contraído y la espalda derecha. Mantén la postura durante, al menos, 20 segundos.',
      'repetir': '20 s'
    },
  ];

  Controller? testingcontroller;

  @override
  void initState() {
    // TODO: implement initState
    controller = testingcontroller ?? Controller()
      ..addListener((event) {});
    super.initState();
  }

  void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success,
      {int? currentIndex}) {
    print(
        "Scroll callback received with data: {direction: $direction, success: $success and index: ${currentIndex ?? 'not given'}}");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    final redesProvider = Provider.of<LauncherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 10, 10, 10),
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
                              width: MediaQuery.of(context).size.width * 0.046,
                            ),
                            Text(
                              "INTERMEDIO",
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
          ),
        ],
      ),
      body: TikTokStyleFullPageScroller(
        contentSize: data.length,
        swipePositionThreshold: 0.2,
        swipeVelocityThreshold: 2000,
        animationDuration: const Duration(milliseconds: 400),
        controller: controller,
        builder: (BuildContext context, int index) {
          final sitios = data[index];

          return PlantillaParaTarea(
            img: sitios["img"],
            title: sitios["title"],
            subtitle: sitios["subtitle"],
            repetir: sitios["repetir"],
            onPressed: () {
              redesProvider.goYoutubeEjercicio(sitios['url']);
            },
          );
        },
      ),
    );
  }
}
