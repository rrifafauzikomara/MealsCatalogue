import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/meals_list.dart';
import '../models/meals_detail.dart';

class MealsApiProvider {
  Client client = Client();

  static final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<MealsList> fetchMovieList(String mealsType) async {
    final response = await client.get(_baseUrl +"filter.php?c=$mealsType");
    if (response.statusCode == 200) {
      return MealsList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<MealsDetail> fetchDetailMeals(String mealsId) async {
    final response = await client.get(_baseUrl + 'lookup.php?i=$mealsId');
    if (response.statusCode == 200) {
      return MealsDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load meals');
    }
  }
}