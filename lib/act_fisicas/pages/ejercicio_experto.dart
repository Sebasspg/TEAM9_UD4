import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/act_fisicas/widgets/plantillaparatarea.dart';
import 'package:team9_ud3_project/providers/launcher_provider.dart';

import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class EjercicioExperto extends StatefulWidget {
  const EjercicioExperto({super.key});

  @override
  State<EjercicioExperto> createState() => _EjercicioExpertoState();
}

class _EjercicioExpertoState extends State<EjercicioExperto> {
  late Controller controller;
  final List<dynamic> data = [
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz1iNzQxMDQwNjY2MjFmODZlMGQxOTM0MjRkY2JjMjlkYQ==',
      'title': 'Elevaciones de rodilla',
      'subtitle':
          'Parate con los pies separados al ancho de tus caderas. Levantá una rodilla hacia el pecho y luego hacé lo mismo con la otra. Continuá el movimiento alternando las piernas.',
      'repetir': '30 veces',
      'url': 'https://www.youtube.com/watch?v=VP8In2738AQ'
    },
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz0xZTY0M2RmODU5MzA3N2YwZjc0YTkyY2JmZDBmYWMwOA==',
      'title': 'Sentadillas',
      'subtitle':
          'Parate con los pies paralelos y, luego, flexioná las rodillas y bajá la cadera hacia el suelo, como si fueras a sentarte. Mantené el pecho elevado y la mirada hacia delante. La espalda debe permanecer lo más recta posible. ',
      'repetir': '20 veces',
      'url': 'https://www.youtube.com/watch?v=G8mX-VJrUi8'
    },
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz04NmJhY2U1YjE2OGQxYjk4NDU0OWZiN2NlODY3Y2JhMQ==',
      'title': 'Burpees',
      'subtitle':
          'Parate con los pies paralelos y, luego, flexioná las rodillas y bajá la cadera hacia el suelo, como si fueras a sentarte. Mantené el pecho elevado y la mirada hacia delante. La espalda debe permanecer lo más recta posible. ',
      'repetir': '25 veces',
      'url': 'https://www.youtube.com/watch?v=IYusabTdFEo'
    },
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz1jMjkzOTgzYzBjNjQ2ZjljMzc2MzI0ZWQwYTIyMzcyZg==',
      'title': 'Fondos de tríceps',
      'subtitle':
          'Apoyá las manos sobre el asiento, con los dedos apuntando hacia delante y los brazos extendidos. La espalda tiene que estar erguida y el abdomen contraído. Bajá la parte superior del cuerpo, flexionando los codos hasta que los glúteos casi toquen el suelo. A continuación, volvé a la posición inicial. ',
      'repetir': '20 veces',
      'url': 'https://www.youtube.com/watch?v=PYapgguXgT8'
    },
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz1iMDEyZDVkZmIyNDAzZmJmZjliMDYxNThhOWExZTgzOA==',
      'title': 'Saltos',
      'subtitle':
          'Podés hacer diferentes tipos de saltos. En los saltos en estrella, por ejemplo, te impulsás hacia arriba mientras alejás los brazos y piernas del cuerpo. También podés probar los saltos con rodillas al pecho, subiendo las dos piernas lo más alto posible. ',
      'repetir': '20 veces',
      'url': 'https://www.youtube.com/shorts/Y0ttEbv0e60'
    },
    {
      'img':
          'https://images-cdn.welcomesoftware.com/Zz01ZDY2ZGM3MDUwYjU5YTEzNGMzMTY1MjhhNTYxNDUwYg==',
      'title': 'Tablas',
      'subtitle':
          'Ubicate boca abajo, apoyá las manos al ancho de hombros y estirá los brazos. Las piernas deben estar rectas, el abdomen contraído y la espalda derecha. Mantené la postura durante, al menos, 20 segundos.',
      'repetir': 'Por 20 segundos',
      'url': 'https://www.youtube.com/watch?v=_mMe3LAfQQA'
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
    final redesProvider = Provider.of<LauncherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const Text(
                "AVANZADO",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                width: 100,
              ),
              Image.asset(
                'assets/login/login_logo.png',
                scale: 2.5,
              ),
            ],
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
