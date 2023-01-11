import 'package:flutter/material.dart';
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
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const Text(
                "REGISTRO DE VACUNAS",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 17,
              ),
              Image.asset(
                'assets/login/login_logo.png',
                scale: 2.5,
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Stack(
            children: [
              SizedBox(
                child: Image.asset("assets/vacunas/vc_imgtodo.png"),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "MIS VACUNAS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          minWidth: 100,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            vacunaProvider
                                .deleteVacunas(Preferences.identificador);
                            vacunaProvider
                                .getVacunas(Preferences.identificador);
                          },
                          child: const Text(
                            'BORRAR TODO',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
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
                    "AÑADIR VACUNA",
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const addVacuna()));
            },
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
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
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  }))
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
