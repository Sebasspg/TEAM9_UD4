import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:team9_ud3_project/model/medicina_model.dart';

class DBMedicina {
  static const _databaseName = 'ExampleM';
  static const _dbVersion = 1;

  static const table = 'ProductosM';

  static const columnId = 'id';
  static const columnNombre = 'nombre';
  static const columnCategoria = 'categoria';
  static const columnInicio = 'inicio';
  static const columnFin = 'fin';
  static const columnIntervalo = 'intervalo';

  //CONFIGURACION
  DBMedicina._privateContructorM();
  static final DBMedicina instance = DBMedicina._privateContructorM();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabaseM();
    return _database;
  }

  _initDatabaseM() async {
    String path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreateM);
  }

  //CREACION DE LA TABLE
  Future _onCreateM(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnNombre TEXT NOT NULL,
        $columnCategoria TEXT NOT NULL,
        $columnInicio TEXT NOT NULL,
        $columnFin TEXT NOT NULL,
        $columnIntervalo TEXT NOT NULL
      )
    ''');
  }

  //CREATE PRODUCT
  Future<int> crearProductoM(ProductoMedicina producto) async {
    Database? db = await instance.database;
    return await db!.insert(table, {
      'nombre': producto.nombre,
      'categoria': producto.categoria,
      'inicio': producto.inicio,
      'fin': producto.fin,
      'intervalo': producto.intervalo,
    });
  }

  //LISTAR PRODUCTOS
  Future<List<Map<String, dynamic>>> queryAllProductosM() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  //BORRAR UN PRODUCTO
  Future<int> deleteM(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId= ?', whereArgs: [id]);
  }

  //BORRAR ALL PRODUCTS
  Future deleteRowAllM() async {
    Database? db = await instance.database;
    db!.delete(table);
  }

  //ACTUALIZAR PRODUCTO
  Future<int?> updateM(ProductoMedicina producto) async {
    Database? db = await instance.database;

    int id = producto.toMap()['id'];
    return await db!.update(table, producto.toMap(),
        where: '$columnId = ?', whereArgs: [id]);
  }
}
