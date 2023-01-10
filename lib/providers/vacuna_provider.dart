import 'package:flutter/material.dart';
import 'package:team9_ud3_project/model/vacuna_model.dart';
import 'package:team9_ud3_project/services/vacuna_service.dart';

class VacunasProvider extends ChangeNotifier {
  final VacunaService _dataBaseService = new VacunaService();

  //Traer datos de vacuno x usuario
  Future getVacunas(String uid) async {
    List<dynamic> data = await _dataBaseService.getVacunas(uid);

    return data.map((vacElement) => Vacuna.fromMap(vacElement)).toList();
  }

  //crear vacunas x uuid
  Future insertVacuna(
      String uid, String nombre, String fecha, String duracion) async {
    await _dataBaseService.createVacuna(uid, nombre, fecha, duracion);
  }
}
