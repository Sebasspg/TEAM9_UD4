import 'package:flutter/material.dart';
import 'package:team9_ud3_project/act_fisicas/pages/ejercicio_basico.dart';
import 'package:team9_ud3_project/act_fisicas/pages/ejercicio_experto.dart';
import 'package:team9_ud3_project/act_fisicas/pages/ejercicio_iniciante.dart';
import 'package:team9_ud3_project/act_fisicas/pages/ejercicio_promedio.dart';

class HacerEjercicio extends StatelessWidget {
  const HacerEjercicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const Text(
                "ACTIVIDADES FÍSICAS",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/login/login_logo.png',
                scale: 2.5,
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Ejercicios en casa",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Por nivel",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.red])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/ejercicio/per1.png',
                        scale: 4,
                      ),
                      const Text(
                        "BÁSICO(INICIO)",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'assets/ejercicio/derechablanca.png',
                        scale: 4,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EjercicioIniciante()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.red, Colors.pink])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/ejercicio/per2.png',
                        scale: 4,
                      ),
                      const Text(
                        "PRINCIPIANTE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'assets/ejercicio/derechablanca.png',
                        scale: 4,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EjercicioBasico()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.white, Colors.blue])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/ejercicio/per3.png',
                        scale: 4,
                      ),
                      const Text(
                        "INTERMEDIO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'assets/ejercicio/derechablanca.png',
                        scale: 4,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EjercicioPromedio()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.green])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/ejercicio/per4.png',
                        scale: 4,
                      ),
                      const Text(
                        "AVANZADO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'assets/ejercicio/derechablanca.png',
                        scale: 4,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EjercicioExperto()));
                },
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text(
                        "¿Listo para ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "comenzar?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Nunca olvides"),
                      Text("alistar una"),
                      Text("botella de agua"),
                    ],
                  ),
                  Image.asset(
                    'assets/ejercicio/guxejercicio.png',
                    scale: 4,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
