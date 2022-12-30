import 'dart:convert';

class ValorNutricional {
  int? id;
  String kcal;
  String grasas;
  String proteinas;
  String carbohidratos;
  String fibra;

  ValorNutricional(
    this.id,
    this.kcal,
    this.grasas,
    this.proteinas,
    this.carbohidratos,
    this.fibra,
  );

  factory ValorNutricional.fromJson(String str) =>
      ValorNutricional.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValorNutricional.fromMap(Map<String, dynamic> json) =>
      ValorNutricional(
        json["id"],
        json["kcal"],
        json["grasas"],
        json["proteinas"],
        json["carbohidratos"],
        json["fibra"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "kcal": kcal,
        "grasas": grasas,
        "proteinas": proteinas,
        "carbohidratos": carbohidratos,
        "fibra": fibra,
      };
}
