import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/model/receta_model.dart';
import 'package:team9_ud3_project/providers/receta_providers.dart';
import 'package:team9_ud3_project/recetas_saludables/detalle_receta.dart';
import 'package:team9_ud3_project/widgets/loading_custom.dart';

class BusquePorPage extends StatelessWidget {
  final String id_cat;

  const BusquePorPage({super.key, required this.id_cat});

  @override
  Widget build(BuildContext context) {
    final RecetaProvider _dataReceta = Provider.of<RecetaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TODAS LAS RECETAS',
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Image.asset(
              'assets/recetas/rslogo.png',
              height: 50,
              width: 110,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: FutureBuilder(
          future: _dataReceta.getRecetaxCategoria(id_cat),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List _snapshot = snapshot.data as List;
              return ListView.builder(
                itemCount: _snapshot.length,
                itemBuilder: (context, index) {
                  Receta rec = _snapshot[index];
                  return RecetasCard(
                    recceta: rec,
                  );
                },
              );
            }
            return LoadingCustom(
              textoCarga: 'Cargando recetas...',
            );
          },
        ),
      ),
    );
  }
}

class RecetasCard extends StatelessWidget {
  final Receta recceta;

  const RecetasCard({super.key, required this.recceta});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.56,
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
                              rrecetas: recceta,
                            ))));
              },
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(recceta.image),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          recceta.titulo,
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
                                    recceta.tiempo),
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
                                    recceta.tip_comida)
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
