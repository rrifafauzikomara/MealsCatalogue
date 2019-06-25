import 'dart:io';
import 'package:dicoding_submission/src/models/favorite_meals.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteProvider {
  FavoriteProvider._();

  static final FavoriteProvider db = FavoriteProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "meals_favorite.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          String queryCreateTableMealsFavorite = "CREATE TABLE favorite ("
              "id INTEGER PRIMARY KEY,"
              "idMeal TEXT,"
              "name TEXT,"
              "thumbnail TEXT,"
              "material TEXT,"
              "type TEXT"
              ")";
          await db.execute(queryCreateTableMealsFavorite);
        });
  }

  Future<List<FavoriteMeals>> getFavoriteFoodsByType(String type) async {
    final db = await database;
    var res = await db.query("favorite", where: "type = ?", whereArgs: [type]);
    List<FavoriteMeals> favoriteFoods = res.isEmpty
        ? []
        : res.map((item) => FavoriteMeals.fromJson(item)).toList();
    return favoriteFoods;
  }

  getFavoriteFoodById(String idMeal) async {
    final db = await database;
    var res =
    await db.query("favorite", where: "idMeal = ?", whereArgs: [idMeal]);
    return res.isEmpty ? null : FavoriteMeals.fromJson(res.first);
  }

  insertFavoriteFood(FavoriteMeals favoriteFood) async {
    final db = await database;
    var res = await db.insert("favorite", favoriteFood.toJson());
    return res;
  }

  deleteFavoriteFoodById(String id) async {
    final db = await database;
    var res = await db.delete("favorite", where: "idMeal = ?", whereArgs: [id]);
    return res;
  }
}