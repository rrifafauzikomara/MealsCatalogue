import 'dart:async';
import 'meals_api_provider.dart';
import '../models/meals_list.dart';
import '../models/meals_detail.dart';

class Repository {
  final mealsApiProvider = MealsApiProvider();

  Future<MealsList> fetchAllMeals(String mealsType) => mealsApiProvider.fetchMovieList(mealsType);

  Future<MealsDetail> fetchDetailMeals(String mealsId) => mealsApiProvider.fetchDetailMeals(mealsId);
}