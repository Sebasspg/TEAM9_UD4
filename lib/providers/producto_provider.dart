import 'package:flutter/cupertino.dart';
import 'package:team9_ud3_project/model/producto_model.dart';
import 'package:team9_ud3_project/services/db_producto.dart';

class ProductoProvider extends ChangeNotifier {
  final dbProducto = DBProducto.instance;

  List<Producto> product = [];

  //CREAR PRODUCTO

  void insertProducto(nombre, categoria, precioc, preciov, stock) async {
    Map<String, dynamic> row = {
      DBProducto.columnNombre: nombre,
      DBProducto.columnCategoria: categoria,
      DBProducto.columnPrecioc: precioc,
      DBProducto.columnPreciov: preciov,
      DBProducto.columnStock: stock,
    };

    Producto producto = Producto.fromMap(row);
    final id = await dbProducto.crearProducto(producto);
    print(id);
    notifyListeners();
  }

  void queryAll() async {
    final allrows = await dbProducto.queryAllProductos();
    product.clear();

    for (var element in allrows) {
      product.add(Producto.fromMap(element));
    }

    notifyListeners();
  }

  // BORRAR UNO
  void delete(id) async {
    final item = await dbProducto.delete(id);
    print(item);
    notifyListeners();
  }
  // BORRAR TODOS

  void deleteAll() async {
    final itemAll = await dbProducto.deleteRowAll();
    notifyListeners();
  }

  void upload(id, nombre, categoria, precioc, preciov, stock) async {
    Producto producto =
        Producto(id, nombre, categoria, precioc, preciov, stock);
    final rowupdate = await dbProducto.update(producto);
    notifyListeners();
  }
}
