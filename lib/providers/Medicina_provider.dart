import 'package:flutter/cupertino.dart';
import 'package:team9_ud3_project/model/medicina_model.dart';
import 'package:team9_ud3_project/services/dbMedicacion_services.dart';

class MedicinaProvider extends ChangeNotifier {
  final dbAlergia = DBMedicina.instance;
  List<ProductoMedicina> product = [];

  //CREAR PRODUCTO
  void insertProducto(nombre, categoria, inicio, fin, intervalo) async {
    Map<String, dynamic> row = {
      DBMedicina.columnNombre: nombre,
      DBMedicina.columnCategoria: categoria,
      DBMedicina.columnInicio: inicio,
      DBMedicina.columnFin: fin,
      DBMedicina.columnIntervalo: intervalo,
    };

    ProductoMedicina producto = ProductoMedicina.fromMap(row);
    final id = await dbAlergia.crearProductoM(producto);
    queryAllM();
    print(id);
    notifyListeners();
  }

  //LISTAR PRODUCTOS
  void queryAllM() async {
    final allrows = await dbAlergia.queryAllProductosM();
    product.clear();
    for (var element in allrows) {
      product.add(ProductoMedicina.fromMap(element));
    }
    notifyListeners();
  }

  //BORRAR UNO
  void delete(id) async {
    final item = await dbAlergia.deleteM(id);
    print(item);
    notifyListeners();
  }

  //BORRAR LA LISTA
  void deleteAllM() async {
    final itemAll = await dbAlergia.deleteRowAllM();
    notifyListeners();
  }

  void updateM(id, nombre, categoria, inicio, fin, intervalo) async {
    ProductoMedicina producto =
        ProductoMedicina(id, nombre, categoria, inicio, fin, intervalo);
    final rowupdate = await dbAlergia.updateM(producto);
    notifyListeners();
  }
}
