import 'dart:convert';

class ValorNutricional {
  ValorNutricional({
    required this.kcal,
    required this.grasas,
    required this.proteinas,
    required this.carbohidratos,
    required this.fibra,
  });

  double kcal;
  double grasas;
  double proteinas;
  double carbohidratos;
  double fibra;

  factory ValorNutricional.fromJson(String str) =>
      ValorNutricional.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValorNutricional.fromMap(Map<String, dynamic> json) =>
      ValorNutricional(
        kcal: json["kcal"].toDouble(),
        grasas: json["grasas"].toDouble(),
        proteinas: json["proteinas"].toDouble(),
        carbohidratos: json["carbohidratos"].toDouble(),
        fibra: json["fibra"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "kcal": kcal,
        "grasas": grasas,
        "proteinas": proteinas,
        "carbohidratos": carbohidratos,
        "fibra": fibra,
      };

  ValorNutricional copyWith() => ValorNutricional(
      kcal: kcal,
      grasas: grasas,
      proteinas: proteinas,
      carbohidratos: carbohidratos,
      fibra: fibra);
}
