import 'package:flutter/cupertino.dart';
import 'package:team9_ud3_project/model/Alerg_model.dart';
import 'package:team9_ud3_project/services/dbalergia_services.dart';

class AlergiaProvider extends ChangeNotifier {
  final dbAlergia = DBAlergia.instance;
  List<ProductoAlergia> product = [];

  //CREAR PRODUCTO
  void insertProducto(nombre, categoria, describe,) async {
    Map<String, dynamic> row = {
      DBAlergia.columnNombre: nombre,
      DBAlergia.columnCategoria: categoria,
      DBAlergia.columnDescribe: describe,
    };

    ProductoAlergia producto = ProductoAlergia.fromMap(row);
    final id = await dbAlergia.crearProductoA(producto);
    queryAllA();
    print(id);
    notifyListeners();
  }

  //LISTAR PRODUCTOS
  void queryAllA() async {
    final allrows = await dbAlergia.queryAllProductosA();
    product.clear();
    for (var element in allrows) {
      product.add(ProductoAlergia.fromMap(element));
    }
    notifyListeners();
  }

  //BORRAR UNO
  void delete(id) async {
    final item = await dbAlergia.deleteA(id);
    print(item);
    notifyListeners();
  }

  //BORRAR LA LISTA
  void deleteAllA() async {
    final itemAll = await dbAlergia.deleteRowAllA();
    notifyListeners();
  }

  void updateA(id, nombre, categoria, describe) async {
    ProductoAlergia producto =
        ProductoAlergia(id, nombre, categoria, describe);
    final rowupdate = await dbAlergia.updateA(producto);
    notifyListeners();
  }
}
