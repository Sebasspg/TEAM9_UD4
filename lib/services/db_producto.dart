import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/producto_model.dart';

class DBProducto {
  static const _databaseName = 'Example';

  static const _dbVersion = 1;

  static const table = 'Productos';

  static const columnId = 'id';
  static const columnNombre = 'nombre';
  static const columnCategoria = 'categoria';
  static const columnPrecioc = 'precioc';
  static const columnPreciov = 'preciov';
  static const columnStock = 'stock';

  DBProducto._privateConstructor();

  static final DBProducto instance = DBProducto._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''

    CREATE TABLE $table(
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnNombre TEXT NOT NULL,
      $columnCategoria TEXT NOT NULL,
      $columnPrecioc TEXT NOT NULL,
      $columnPreciov TEXT NOT NULL,
      $columnStock TEXT NOT NULL

    )

''');
  }

  ///CREATE PRODUCT

  Future<int> crearProducto(Producto producto) async {
    Database? db = await instance.database;

    return await db!.insert(table, {
      'nombre': producto.nombre,
      'categoria': producto.categoria,
      'precioc': producto.precioc,
      'preciov': producto.preciov,
      'stock': producto.stock
    });
  }

  //LISTAR PRODUCTOS
  Future<List<Map<String, dynamic>>> queryAllProductos() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  //BORRAR PRODUCTO

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  //BORRAR TODO

  Future deleteRowAll() async {
    Database? db = await instance.database;

    db!.delete(table);
  }

  //ACTUALIZAR PRODUCTO

  Future<int?> update(Producto producto) async {
    Database? db = await instance.database;

    int id = producto.toMap()['id'];
    return await db!.update(table, producto.toMap(),
        where: '$columnId = ?', whereArgs: [id]);
  }
}
