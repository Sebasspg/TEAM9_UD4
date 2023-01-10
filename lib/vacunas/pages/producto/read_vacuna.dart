import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:team9_ud3_project/model/vacuna_model.dart';
import 'package:team9_ud3_project/preferences/logearse_preferences.dart';

import 'package:team9_ud3_project/providers/vacuna_provider.dart';
import 'package:team9_ud3_project/widgets/loading_custom.dart';

class VacunaTest extends StatelessWidget {
  const VacunaTest({super.key});

  @override
  Widget build(BuildContext context) {
    final vacunaProvider = Provider.of<VacunasProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: FutureBuilder(
          future: vacunaProvider.getVacunas(Preferences.identificador),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List _snapshot = snapshot.data as List;
              return ListView.builder(
                itemCount: _snapshot.length,
                itemBuilder: (context, index) {
                  Vacuna rec = _snapshot[index];
                  return ListTile(
                    title: Text(rec.nombre),
                    subtitle: Text(rec.fecha),
                  );
                },
              );
            }
            return LoadingCustom(
              textoCarga: 'Cargando vacunas...',
            );
          },
        ),
      ),
    );
  }
}
