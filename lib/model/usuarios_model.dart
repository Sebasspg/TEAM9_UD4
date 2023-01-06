// To parse this JSON data, do
//
// final users = usersFromMap(jsonString);

import 'dart:convert';

class Users {
  Users({
    required this.id,
    required this.uuid,
    required this.email,
    required this.nombre,
    required this.idVacuna,
    required this.idMedicacion,
    required this.idAlergia,
    required this.edad,
    required this.genero,
    required this.image,
    required this.peso,
    required this.altura,
    required this.tipoSangre,
  });

  int id;
  String uuid;
  String email;
  String nombre;
  int idVacuna;
  int idMedicacion;
  int idAlergia;
  String edad;
  String genero;
  String image;
  String peso;
  String altura;
  String tipoSangre;

  factory Users.fromJson(String str) => Users.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        id: json["id"],
        uuid: json["uuid"],
        email: json["email"],
        nombre: json["nombre"],
        idVacuna: json["id_vacuna"],
        idMedicacion: json["id_medicacion"],
        idAlergia: json["id_alergia"],
        edad: json["edad"],
        genero: json["genero"],
        image: json["image"],
        peso: json["peso"],
        altura: json["altura"],
        tipoSangre: json["tipo_sangre"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uuid": uuid,
        "email": email,
        "nombre": nombre,
        "id_vacuna": idVacuna,
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
