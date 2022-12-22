import 'package:team9_ud3_project/model/nutri_model.dart';

import 'dart:convert';

class Receta {
  int id;
  String titulo;
  String tiempo;
  int id_categoria;
  String image;
  String tip_comida;
  int id_nutricional;

  Receta(
    this.id,
    this.titulo,
    this.tiempo,
    this.id_categoria,
    this.image,
    this.tip_comida,
    this.id_nutricional,
  );

  factory Receta.fromJson(String str) => Receta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Receta.fromMap(Map<String, dynamic> json) => Receta(
        json["id"],
        json["titulo"],
        json["tiempo"],
        json["id_categoria"],
        json["image"],
        json["tip_comida"],
        json["id_nutricional"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "tiempo": tiempo,
        "id_categoria": id_categoria,
        "image": image,
        "tip_comida": tip_comida,
        "id_nutricional": id_nutricional,
      };
}
