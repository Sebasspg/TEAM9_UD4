import 'package:flutter/material.dart';

import 'package:team9_ud3_project/model/categoria_model.dart';
import 'package:team9_ud3_project/model/nutri_model.dart';
import 'package:team9_ud3_project/model/receta_model.dart';
import 'package:team9_ud3_project/services/receta_supabase_service.dart';

class RecetaProvider extends ChangeNotifier {
  final UsuarioDataService _dataBaseService = UsuarioDataService();

  //listar categorias
  Future getReceta() async {
    List data = await _dataBaseService.getReceta();

    return data.map((recetaElement) => Receta.fromMap(recetaElement)).toList();
  }

  Future getRecetaxCategoria(String id) async {
    List<dynamic> data = await _dataBaseService.getRecetaxCategoria(id);

    return data.map((recetaElement) => Receta.fromMap(recetaElement)).toList();
  }

  //listar recetas con su valor nutricional
  Future getRecetaxValorNutri(int id) async {
    List<dynamic> data = await _dataBaseService.getRecetaxValorNutri(id);
    print('providers---');

    return data
        .map((valorElement) => ValorNutricional.fromMap(valorElement))
        .toList();
    print(data);
  }

  //listar categorias
  Future getCategoria() async {
    List data = await _dataBaseService.getCategoria();

    return data
        .map((categoriaElement) => Categoria.fromMap(categoriaElement))
        .toList();
  }
}
