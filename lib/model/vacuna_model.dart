// To parse this JSON data, do
//
//     final vacuna = vacunaFromMap(jsonString);

import 'dart:convert';

class Vacuna {
  Vacuna(
    this.id,
    this.nombre,
    this.fecha,
    this.duracion,
    this.uuid,
  );

  int id;
  String nombre;
  String fecha;
  String duracion;
  String uuid;

  factory Vacuna.fromJson(String str) => Vacuna.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vacuna.fromMap(Map<String, dynamic> json) => Vacuna(
        json["id"],
        json["nombre"],
        json["fecha"],
        json["duracion"],
        json["uuid"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "fecha": fecha,
        "duracion": duracion,
        "uuid": uuid,
      };
}
