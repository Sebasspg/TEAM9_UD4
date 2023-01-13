import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/providers/launcher_provider.dart';

class PlantillaParaTarea extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? repetir;
  final Function()? onPressed;

  const PlantillaParaTarea(
      {super.key,
      this.img,
      this.title,
      this.subtitle,
      this.repetir,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.86,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("$img"), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Text(
                    "$title",
                    style: GoogleFonts.quicksand(
                        fontSize: 18.3, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.width * 0.15,
                    child: Image.asset("assets/ejercicio/div.png")),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "REPETICIONES",
                        style: GoogleFonts.quicksand(
                            fontSize: 11, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "$repetir",
                        style: GoogleFonts.quicksand(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              child: Text("$subtitle",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.quicksand(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: onPressed,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.13,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color.fromARGB(255, 51, 198, 244),Color.fromARGB(255, 111, 194, 127)])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Text(
                      "VER TUTORIAL",
                      style: GoogleFonts.quicksand(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    Image.asset(
                      "assets/ejercicio/derechablanca.png",
                      scale: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.03,
          ),
          Image.asset(
            "assets/ejercicio/abajonegra.png",
            scale: 4,
          ),
        ],
      ),
    );
  }
}
