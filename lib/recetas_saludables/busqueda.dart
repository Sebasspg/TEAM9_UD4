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
      appBar: AppBar(
        title: Text(
          'Recetas',
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
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
    );
  }
}
