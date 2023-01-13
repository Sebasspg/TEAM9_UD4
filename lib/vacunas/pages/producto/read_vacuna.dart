import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:team9_ud3_project/model/vacuna_model.dart';
import 'package:team9_ud3_project/preferences/logearse_preferences.dart';

import 'package:team9_ud3_project/providers/vacuna_provider.dart';
import 'package:team9_ud3_project/vacunas/pages/producto/add_vacuna.dart';
import 'package:team9_ud3_project/widgets/loading_custom.dart';

class VacunaTest extends StatelessWidget {
  const VacunaTest({super.key});

  @override
  Widget build(BuildContext context) {
    final vacunaProvider = Provider.of<VacunasProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(children: [
          SizedBox(
              width: double.infinity,
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
                              width: MediaQuery.of(context).size.width * 0.046,
                            ),
                            Text(
                              "REGISTRO DE VACUNAS",
                              style: GoogleFonts.quicksand(
                                  fontSize: 12, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/login/login_logo.png',
                      width: MediaQuery.of(context).size.width * 0.245,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
            height: MediaQuery.of(context).size.width * 0.06,
          ),
          Stack(
            children: [
              SizedBox(
                child: Image.asset("assets/vacunas/vc_imgtodo.png"),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            height: MediaQuery.of(context).size.width * 0.08,
                            minWidth: MediaQuery.of(context).size.width * 0.06,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: () {
                              vacunaProvider
                                  .deleteVacunas(Preferences.identificador);
                              vacunaProvider
                                  .getVacunas(Preferences.identificador);
                            },
                            child: Text(
                              'BORRAR TODO',
                              style: GoogleFonts.quicksand(
                        fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: vacunaProvider.listvacuna.length,
                itemBuilder: (context, index) {
                  final vacunauso = vacunaProvider.listvacuna[index];
                  return ListTile(
                    title: Text(vacunauso['nombre'] +
                        "| Duracion en meses " +
                        vacunauso['duracion']),
                    subtitle: Text(vacunauso['fecha']),
                    trailing: IconButton(
                      onPressed: () {
                        vacunaProvider
                            .deleteVacuna((vacunauso['id']).toString());
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  );
                }),
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
                      colors: [Color.fromARGB(255, 51, 198, 244),
                          Color.fromARGB(255, 111, 194, 127)])),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "AÑADIR VACUNA",
                  style: GoogleFonts.quicksand(
                        fontSize: 11, fontWeight: FontWeight.w900, color: Colors.white),
                ),
                Image.asset(
                  'assets/medicinas/flechamed.png',
                  alignment: Alignment.centerRight,
                  scale: 4,
                ),
              ],
            ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const addVacuna()));
            },
          ),
          
          // child: FutureBuilder(
          //   future: vacunaProvider.getVacunas(Preferences.identificador),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       List _snapshot = snapshot.data as List;
          //       return ListView.builder(
          //         itemCount: _snapshot.length,
          //         itemBuilder: (context, index) {
          //           Vacuna rec = _snapshot[index];
          //           return ListTile(
          //             title: Text(
          //                 rec.nombre + "| Duracion en meses " + rec.duracion),
          //             subtitle: Text(rec.fecha),
          //             trailing: IconButton(
          //               onPressed: () {
          //                 vacunaProvider.deleteVacuna((rec.id).toString());
          //               },
          //               icon: const Icon(
          //                 Icons.delete,
          //                 color: Colors.red,
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     }
          //     return LoadingCustom(
          //       textoCarga: 'Cargando vacunas...',
          //     );
          //   },
          // ),
        ]),
      ),
    );
  }
}
