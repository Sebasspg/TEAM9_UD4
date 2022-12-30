import 'package:team9_ud3_project/services/db_producto.dart';

class Producto {
  int? id;
  String? nombre;
  String? categoria;
  String? precioc;
  String? preciov;
  String? stock;

  Producto(
    this.id,
    this.nombre,
    this.categoria,
    this.precioc,
    this.preciov,
    this.stock,
  );

  Producto.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nombre = map['nombre'];
    categoria = map['categoria'];
    precioc = map['precioc'];
    preciov = map['preciov'];
    stock = map['stock'];
  }

  Map<String, dynamic> toMap() {
    return {
      DBProducto.columnId: id,
      DBProducto.columnNombre: nombre,
      DBProducto.columnCategoria: categoria,
      DBProducto.columnPrecioc: precioc,
      DBProducto.columnPreciov: preciov,
      DBProducto.columnStock: stock,
    };
  }
}
