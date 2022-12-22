

import 'package:team9_ud3_project/services/dbMedicacion_services.dart';

class ProductoMedicina {
  int? id;
  String? nombre;
  String? categoria;
  String? inicio;
  String? fin;
  String? intervalo;

  ProductoMedicina(this.id, this.nombre, this.categoria, this.inicio, this.fin, this.intervalo);

  ProductoMedicina.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    nombre = map["nombre"];
    categoria = map["categoria"];
    inicio = map["inicio"];
    fin = map["fin"];
    intervalo = map["intervalo"];
    
  }

  Map<String, dynamic> toMap() {
    return {
      DBMedicina.columnId: id,
      DBMedicina.columnNombre: nombre,
      DBMedicina.columnCategoria: categoria,
      DBMedicina.columnInicio: inicio,
      DBMedicina.columnFin: fin,
      DBMedicina.columnIntervalo: intervalo,
    };
  }
}
