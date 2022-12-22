import 'package:flutter/material.dart';

import 'package:team9_ud3_project/model/categoria_model.dart';
import 'package:team9_ud3_project/model/receta_model.dart';
import 'package:team9_ud3_project/services/receta_supabase_service.dart';

class RecetaProvider extends ChangeNotifier {
  final DatabaseService _dataBaseService = new DatabaseService();

  //listar categorias
  Future getReceta() async {
    List data = await _dataBaseService.getReceta();

    return data.map((recetaElement) => Receta.fromMap(recetaElement)).toList();
  }

  Future getRecetaxCategoria(String id) async {
    List<dynamic> data = await _dataBaseService.getRecetaxCategoria(id);

    return data.map((recetaElement) => Receta.fromMap(recetaElement)).toList();
  }

  //listar categorias
  Future getCategoria() async {
    List data = await _dataBaseService.getCategoria();

    return data
        .map((categoriaElement) => Categoria.fromMap(categoriaElement))
        .toList();
  }
}
