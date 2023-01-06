import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/model/nutri_model.dart';
import 'package:team9_ud3_project/model/receta_model.dart';
import 'package:team9_ud3_project/providers/receta_providers.dart';

class DetalleReceta extends StatelessWidget {
  final Receta rrecetas;

  const DetalleReceta({super.key, required this.rrecetas});

  @override
  Widget build(BuildContext context) {
    //splita del json ingredientesa
    final String textonew = rrecetas.ingredientes.join(" , ");
    final String newDescription = textonew.replaceAll(",", "\n");

    //traer datos de valor nutricional
    final RecetaProvider _dataReceta = Provider.of<RecetaProvider>(context);

    //final ValorNutricional valorN = valor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/recetas/rslogo.png',
              height: 50,
              width: 150,
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Image.network(
                    rrecetas.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.42,
                width: double.infinity,
                child: Image.asset('assets/recetas/rscapaoscura.png'),
              ),
              Positioned(
                left: 20.0,
                right: 1,
                top: MediaQuery.of(context).size.height * 0.26,
                child: Text(
                  rrecetas.titulo,
                  style: GoogleFonts.quicksand(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: 1,
                right: 1.0,
                top: MediaQuery.of(context).size.height * 0.36,
                bottom: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/salad.png',
                                height: 35,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                      ),
                                      'Raciones'),
                                  Text(
                                      style: GoogleFonts.quicksand(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      '1 Raciones'),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/clock.png',
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                      ),
                                      'Prepación'),
                                  Text(
                                    rrecetas.tiempo,
                                    style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/mosaic.png',
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                      ),
                                      'Tipo de Comida'),
                                  Text(
                                    rrecetas.tip_comida,
                                    style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  style: GoogleFonts.quicksand(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  'Ingredientes'),
                              Text(
                                newDescription,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.quicksand(
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  style: GoogleFonts.quicksand(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  'Prepación: '),
                              Text(
                                  style: GoogleFonts.quicksand(fontSize: 20),
                                  '1. Echa el yogurt eb un bol y añadir los copos de avena junto con las semillas'),
                              Text(
                                  style: GoogleFonts.quicksand(fontSize: 20),
                                  '2. Añadir las fresas (o las fruta que tengamos) y canela al gusto'),
                              const SizedBox(height: 10.0),
                              Text(
                                'Valor Nutricional',
                                style: GoogleFonts.quicksand(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 15.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: TablaNutricion(),
                              ),
                              const SizedBox(height: 50.0),
                              /*
                              
                              Container(
                                  width: double.infinity,
                                  height: 400,
                                  child: FutureBuilder(
                                    future: _dataReceta
                                        .getRecetaxValorNutri(rrecetas.id),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List _snapshot =
                                            snapshot.data as List;
                                        return ListView.builder(
                                          itemCount: _snapshot.length,
                                          itemBuilder: (context, index) {
                                            ValorNutricional val =
                                                _snapshot[index];
                                            return Column(
                                              children: [
                                                Text(val.kcal),
                                                Text(val.grasas),
                                                Text(val.carbohidratos),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                      return CircularProgressIndicator();
                                    },
                                  ))*/
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class TablaNutricion extends StatelessWidget {
  const TablaNutricion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(0.4),
          width: 1),
      columnWidths: const {
        0: FlexColumnWidth(1.1),
        1: FlexColumnWidth(2),
      },
      children: [
        TableRow(children: [
          Text(
            "345.40",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
          Text(
            "Kcal",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
        ]),
        TableRow(children: [
          Text(
            "15.4 g.",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
          Text(
            "Grasas",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
        ]),
        TableRow(children: [
          Text(
            "17.51 g.",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
          Text(
            "Proteinas",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
        ]),
        TableRow(children: [
          Text(
            "52.56 g.",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
          Text(
            "Carbohidratos",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
        ]),
        TableRow(children: [
          Text(
            "12.25 g.",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
          Text(
            "Fibra",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
        ]),
      ],
    );
  }
}
