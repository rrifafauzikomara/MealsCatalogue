import 'dart:async';
import 'meals_api_provider.dart';
import 'favorite_provider.dart';
import '../models/meals_list.dart';
import '../models/meals_detail.dart';
import '../models/favorite_meals.dart';

class Repository {
  final mealsApiProvider = MealsApiProvider();
//  final favoriteProvider = FavoriteProvider.instance;

  Future<MealsList> fetchAllMeals(String mealsType) => mealsApiProvider.fetchMovieList(mealsType);

  Future<MealsDetail> fetchDetailMeals(String mealsId) => mealsApiProvider.fetchDetailMeals(mealsId);

//  Future<int> insertFavorite(Map<String, dynamic> row) => favoriteProvider.insert(row);
//
//  Future<int> deleteFavorite(int id) => favoriteProvider.delete(id);
//
//  Future<List<FavoriteMeals>> showAllData() => favoriteProvider.queryAllRows();
//
//  Future<int> rowCount() => favoriteProvider.queryRowCount();
}