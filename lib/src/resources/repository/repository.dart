import 'dart:async';
import 'package:dicoding_submission/src/resources/api/meals_api_provider.dart';
import 'package:dicoding_submission/src/models/meals.dart';

class Repository {

  final mealsApiProvider = MealsApiProvider();

  Future<MealsResult> fetchAllMeals(String mealsType) => mealsApiProvider.fetchMovieList(mealsType);

  Future<MealsResult> fetchDetailMeals(String mealsId) => mealsApiProvider.fetchDetailMeals(mealsId);

}