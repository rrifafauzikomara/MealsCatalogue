//import 'dart:io';
//import 'package:sqflite/sqflite.dart';
//import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';
//import '../models/favorite_meals.dart';
//
//class FavoriteProvider {
//  static final _databaseName = "meals.db";
//  static final _databaseVersion = 1;
//
//  static final table = 'favorite';
//
//  static final columnId = '_id';
//  static final columnCode = 'code';
//  static final columnName = 'name';
//  static final columnImage = 'img';
//
//  FavoriteProvider._privateConstructor();
//
//  static final FavoriteProvider instance =
//  FavoriteProvider._privateConstructor();
//  static Database _database;
//
//  Future<Database> get database async {
//    if (_database != null) return _database;
//
//    _database = await _initDatabase();
//    return _database;
//  }
//
//  _initDatabase() async {
//    Directory documentsDirectory = await getApplicationDocumentsDirectory();
//    String path = join(documentsDirectory.path, _databaseName);
//    return await openDatabase(path,
//        version: _databaseVersion, onCreate: _onCreate);
//  }
//
//  Future _onCreate(Database db, int version) async {
//    await db.execute('''
//      CREATE TABLE $table(
//      $columnId INTEGER PRIMARY KEY,
//      $columnCode TEXT NOT NULL,
//      $columnName TEXT NOT NULL,
//      $columnImage TEXT NOT NULL)
//      ''');
//  }
//
//  Future<int> insert(Map<String, dynamic> row) async {
//    Database db = await instance.database;
//    return await db.insert(table, row);
//  }
//
//  Future<List<FavoriteMeals>> queryAllRows() async {
//    Database db = await instance.database;
//
//    final List<Map<String, dynamic>> maps = await db.query(table);
//
//    return List.generate(maps.length, (i) {
//      return FavoriteMeals(
//        maps[i][columnId],
//        maps[i][columnCode],
//        maps[i][columnName],
//        maps[i][columnImage],
//      );
//    });
//  }
//
//  Future<int> queryRowCount() async {
//    Database db = await instance.database;
//    return Sqflite.firstIntValue(
//        await db.rawQuery('SELECT COUNT(*) FROM $table'));
//  }
//
//  Future<int> delete(int id) async {
//    Database db = await instance.database;
//    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
//  }
//}