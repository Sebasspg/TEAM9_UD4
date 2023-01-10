import 'package:flutter/material.dart';
import 'package:team9_ud3_project/model/usuarios_model.dart';

import 'package:team9_ud3_project/services/usuarios_service.dart';

class UsuarioProvider extends ChangeNotifier {
  final UsuarioDataService _dataBaseService = new UsuarioDataService();

  //listar user por uuid
  Future getusuario(String uid) async {
    List<dynamic> data = await _dataBaseService.getUsuarios(uid);

    return data.map((userElement) => Users.fromMap(userElement)).toList();
  }

  //act usuario por uuid
  Future uptusuario(String uid, String nombre, String edad, String genero,
      String peso, String altura, String tipo_sangre) async {
    await _dataBaseService.updateUsuarios(
        uid, nombre, edad, genero, peso, altura, tipo_sangre);
  }
}
