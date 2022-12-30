
import 'package:team9_ud3_project/services/dbalergia_services.dart';

class ProductoAlergia {
  int? id;
  String? nombre;
  String? categoria;
  String? describe;

  ProductoAlergia(this.id, this.nombre, this.categoria, this.describe);

  ProductoAlergia.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    nombre = map["nombre"];
    categoria = map["categoria"];
    describe = map["describe"];
    
  }

  Map<String, dynamic> toMap() {
    return {
      DBAlergia.columnId: id,
      DBAlergia.columnNombre: nombre,
      DBAlergia.columnCategoria: categoria,
      DBAlergia.columnDescribe: describe,
    };
  }
}
