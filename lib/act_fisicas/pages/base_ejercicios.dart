import 'package:flutter/material.dart';

class EjercicioBase extends StatelessWidget {
  const EjercicioBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicios Iniciante"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 350,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images-cdn.welcomesoftware.com/Zz1iNzQxMDQwNjY2MjFmODZlMGQxOTM0MjRkY2JjMjlkYQ=="),
                    fit: BoxFit.cover)),
          ),
          const Text(
            "Elevaciones de rodilla",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 54, 57, 244)),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
                "Parate con los pies separados al ancho de tus caderas. Levantá una rodilla hacia el pecho y luego hacé lo mismo con la otra. Continuá el movimiento alternando las piernas.",
                style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "HACER 20 REPETICIONES",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
