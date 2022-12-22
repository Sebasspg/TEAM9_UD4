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
        title: const Text("Ejecicios Caseros"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2014/10/22/17/25/woman-498257_960_720.jpg"),
                          fit: BoxFit.cover)),
                  child: MaterialButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EjercicioIniciante()));
                  }),
                ),
                const Text(
                  "EJERCICIO PARA INICIANTE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2016/11/14/03/06/woman-1822459_960_720.jpg"),
                          fit: BoxFit.cover)),
                  child: MaterialButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EjercicioBasico()));
                  }),
                ),
                const Text(
                  "EJERCICIO PARA PRINCIPIANTE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2016/11/22/22/24/adult-1850925_960_720.jpg"),
                          fit: BoxFit.cover)),
                  child: MaterialButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EjercicioPromedio()));
                  }),
                ),
                const Text(
                  "EJERCICIO PARA PROMEDIO",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2017/08/07/14/02/man-2604149_960_720.jpg"),
                          fit: BoxFit.cover)),
                  child: MaterialButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EjercicioExperto()));
                  }),
                ),
                const Text(
                  "EJERCICIO PARA EXPERTO",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
