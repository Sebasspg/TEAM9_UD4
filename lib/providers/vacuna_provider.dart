import 'package:flutter/material.dart';
import 'package:team9_ud3_project/model/vacuna_model.dart';
import 'package:team9_ud3_project/services/vacuna_service.dart';

class VacunasProvider extends ChangeNotifier {
  final VacunaService _dataBaseService = VacunaService();
  List<dynamic> listvacuna = [];
  int contadorVacuna = 0;
  //Traer datos de vacuno x usuario
  void getVacunas(String uid) async {
    List<dynamic> data = await _dataBaseService.getVacunas(uid);
    contadores(data);
    listvacuna = data;

    print('DATA GET=> $data');
    notifyListeners();
    //return data;
    // return data.map((vacElement) => Vacuna.fromMap(vacElement)).toList();
  }

  void contadores(List<dynamic> datos) {
    contadorVacuna = datos.length;
    notifyListeners();
  }

  //crear vacunas x uuid
  Future insertVacuna(
      String uid, String nombre, String fecha, String duracion) async {
    await _dataBaseService.createVacuna(uid, nombre, fecha, duracion);
  }

  Future deleteVacuna(String id_vacuna) async {
    await _dataBaseService.DeleteVacuna(id_vacuna);
  }

  Future deleteVacunas(String uuid) async {
    await _dataBaseService.BorrarTodoVacuna(uuid);
  }
}
