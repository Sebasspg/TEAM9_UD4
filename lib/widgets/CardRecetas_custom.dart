import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team9_ud3_project/model/receta_model.dart';
import 'package:team9_ud3_project/recetas_saludables/detalle_receta.dart';

class RecetasCard extends StatelessWidget {
  final Receta rrecetas;

  const RecetasCard({super.key, required this.rrecetas});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.89,
      width: double.infinity,
      child: Card(
        color: Color.fromARGB(255, 230, 231, 232),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => DetalleReceta(
                              rrecetas: rrecetas,
                            ))));
              },
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(rrecetas.image),fit: BoxFit.cover,
                    ),
                  ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rrecetas.titulo,
                          style: GoogleFonts.quicksand(
                                    fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    style: GoogleFonts.quicksand(
                                    fontSize: 12, fontWeight: FontWeight.w800),
                                    'PREPARACIÓN'),
                                Text(
                                    style: GoogleFonts.quicksand(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                                    rrecetas.tiempo),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    style: GoogleFonts.quicksand(
                                    fontSize: 12, fontWeight: FontWeight.w800),
                                    'Kcal'),
                                Text(
                                    style: GoogleFonts.quicksand(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                                    '172.22')
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    style: GoogleFonts.quicksand(
                                    fontSize: 12, fontWeight: FontWeight.w800),
                                    'Tipo de Comida'),
                                Text(
                                    style: GoogleFonts.quicksand(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                                    rrecetas.tip_comida)
                              ],
                            ),
                            Image.asset("assets/recetas/rs flecha.png", scale: 4,)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
