import 'package:flutter/material.dart';
import 'package:team9_ud3_project/model/usuarios_model.dart';
import 'package:team9_ud3_project/services/usuarios_service.dart';

class UsuarioProvider extends ChangeNotifier {
  final UsuarioDataService _dataBaseService = new UsuarioDataService();

  //listar categorias
  Future getusuario() async {
    List data = await _dataBaseService.getUsuarios();

    return data.map((userElement) => Users.fromMap(userElement)).toList();
  }
}
