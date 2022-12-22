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
    return Column(
      children: [
        Container(
          width: 500,
          height: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("$img"), fit: BoxFit.cover)),
        ),
        Text(
          "$title",
          style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 54, 57, 244)),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Text(
              "$subtitle",
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
        MaterialButton(
          height: 50,
          minWidth: 100,
          elevation: 1,
          color: const Color.fromARGB(255, 231, 118, 74),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: (() {}),
          child: Text(
            "$repetir",
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        )
      ],
    );
  }
}
