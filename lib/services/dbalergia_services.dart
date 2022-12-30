import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:team9_ud3_project/model/Alerg_model.dart';

class DBAlergia {
  static const _databaseName = 'ExampleA';
  static const _dbVersion = 1;

  static const table = 'ProductosA';

  static const columnId = 'id';
  static const columnNombre = 'nombre';
  static const columnCategoria = 'categoria';
  static const columnDescribe = 'describe';

  //CONFIGURACION
  DBAlergia._privateContructorA();
  static final DBAlergia instance = DBAlergia._privateContructorA();

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

  //CREACION DE LA TABLE
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnNombre TEXT NOT NULL,
        $columnCategoria TEXT NOT NULL,
        $columnDescribe TEXT NOT NULL
      )
    ''');
  }

  //CREATE PRODUCT
  Future<int> crearProductoA(ProductoAlergia producto) async {
    Database? db = await instance.database;
    return await db!.insert(table, {
      'nombre': producto.nombre,
      'categoria': producto.categoria,
      'describe': producto.describe
    });
  }

  //LISTAR PRODUCTOS
  Future<List<Map<String, dynamic>>> queryAllProductosA() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  //BORRAR UN PRODUCTO
  Future<int> deleteA(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId= ?', whereArgs: [id]);
  }

  //BORRAR ALL PRODUCTS
  Future deleteRowAllA() async {
    Database? db = await instance.database;
    db!.delete(table);
  }

  //ACTUALIZAR PRODUCTO
  Future<int?> updateA(ProductoAlergia producto) async {
    Database? db = await instance.database;

    int id = producto.toMap()['id'];
    return await db!.update(table, producto.toMap(),
        where: '$columnId = ?', whereArgs: [id]);
  }
}
