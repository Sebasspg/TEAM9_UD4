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
      height: 460,
      width: double.infinity,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          margin: EdgeInsets.all(10),
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
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
                  Image(
                    image: NetworkImage(rrecetas.image),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          rrecetas.titulo,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    style: GoogleFonts.montserrat(fontSize: 15),
                                    'Preparacion'),
                                Text(
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    rrecetas.tiempo),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    style: GoogleFonts.montserrat(fontSize: 15),
                                    'Kcal'),
                                Text(
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    '172.22')
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    style: GoogleFonts.montserrat(fontSize: 15),
                                    'Tipo de Comida'),
                                Text(
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    rrecetas.tip_comida)
                              ],
                            ),
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
