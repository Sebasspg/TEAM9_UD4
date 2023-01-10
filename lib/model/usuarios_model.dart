// To parse this JSON data, do
//
// final users = usersFromMap(jsonString);

import 'dart:convert';

class Users {
  int id;
  String uuid;
  String email;
  String nombre;
  int idMedicacion;
  int idAlergia;
  String edad;
  String genero;
  String image;
  String peso;
  String altura;
  String tipoSangre;

  Users(
    this.id,
    this.uuid,
    this.email,
    this.nombre,
    this.idMedicacion,
    this.idAlergia,
    this.edad,
    this.genero,
    this.image,
    this.peso,
    this.altura,
    this.tipoSangre,
  );

  factory Users.fromJson(String str) => Users.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        json["id"],
        json["uuid"],
        json["email"],
        json["nombre"],
        json["id_medicacion"],
        json["id_alergia"],
        json["edad"],
        json["genero"],
        json["image"],
        json["peso"],
        json["altura"],
        json["tipo_sangre"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uuid": uuid,
        "email": email,
        "nombre": nombre,
        "id_medicacion": idMedicacion,
        "id_alergia": idAlergia,
        "edad": edad,
        "genero": genero,
        "image": image,
        "peso": peso,
        "altura": altura,
        "tipo_sangre": tipoSangre,
      };
}
