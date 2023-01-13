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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 20, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      child: Image.asset(
                                          'assets/menuprincipal/bien/flecha_negra_volver.png'),
                                      onPressed: () {
                                        Navigator.pop(
                                          (context),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.046,
                                ),
                                Text(
                                  "TODAS LAS RECETAS",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 12, fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/login/login_logo.png',
                              width: MediaQuery.of(context).size.width * 0.245,
                            ),
                            SizedBox(
                  height: MediaQuery.of(context).size.width * 0.005,
                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.91,
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
        ],
      ),
    );
  }
}

class RecetasCard extends StatelessWidget {
  final Receta recceta;

  const RecetasCard({super.key, required this.recceta});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Container(
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
                                rrecetas: recceta,
                              ))));
                },
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(recceta.image),fit: BoxFit.cover,
                      ),
                    ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recceta.titulo,
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
                                      recceta.tiempo),
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
                                      recceta.tip_comida)
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
      ),
    );
  }
}
