import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/model/receta_model.dart';
import 'package:team9_ud3_project/providers/receta_providers.dart';
import 'package:team9_ud3_project/recetas_saludables/detalle_receta.dart';
import 'package:team9_ud3_project/widgets/CardRecetas_custom.dart';
import 'package:team9_ud3_project/widgets/loading_custom.dart';

class BusquedaPage extends StatelessWidget {
  const BusquedaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecetaProvider _dataReceta = Provider.of<RecetaProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
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
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: FutureBuilder(
                  future: _dataReceta.getReceta(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List _snapshot = snapshot.data as List;
                      return ListView.builder(
                        itemCount: _snapshot.length,
                        itemBuilder: (context, index) {
                          Receta rec = _snapshot[index];
                          return RecetasCard(rrecetas: rec);
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
        ),
      ),
    );
  }
}
