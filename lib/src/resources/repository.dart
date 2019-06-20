import 'dart:async';
import 'meals_api_provider.dart';
import '../models/meals.dart';

class Repository {
  final mealsApiProvider = MealsApiProvider();

  Future<MealsResult> fetchAllMeals(String mealsType) => mealsApiProvider.fetchMovieList(mealsType);

  Future<MealsResult> fetchDetailMeals(String mealsId) => mealsApiProvider.fetchDetailMeals(mealsId);
}