import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantillaParaTarea extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? repetir;

  const PlantillaParaTarea(
      {super.key, this.img, this.title, this.subtitle, this.repetir});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 500,
            height: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("$img"), fit: BoxFit.cover)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: Text(
                  "$title",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                  height: 50,
                  width: 10,
                  child: Image.asset("assets/ejercicio/div.png")),
              Column(
                children: [
                  const Text("REPETICIONES"),
                  Text(
                    "$repetir",
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Text("$subtitle",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.quicksand(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.blue, Colors.green])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "IR AL TUTORIAL",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "assets/ejercicio/derechablanca.png",
                    scale: 2,
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
          Image.asset(
            "assets/ejercicio/abajonegra.png",
            scale: 2,
          ),
        ],
      ),
    );
  }
}
