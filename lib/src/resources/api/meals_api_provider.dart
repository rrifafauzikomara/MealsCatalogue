import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:dicoding_submission/src/models/meals.dart';

class MealsApiProvider {
  Client client = Client();

  static final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<MealsResult> fetchMealsList(String mealsType) async {
    final response = await client.get(_baseUrl +"filter.php?c=$mealsType");
    if (response.statusCode == 200) {
      return MealsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<MealsResult> fetchDetailMeals(String mealsId) async {
    final response = await client.get(_baseUrl + 'lookup.php?i=$mealsId');
    if (response.statusCode == 200) {
      return MealsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<MealsResult> searchMeals(String mealsName) async {
    final response = await client.get(_baseUrl + 'search.php?s=$mealsName');
    if (response.statusCode == 200) {
      return MealsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load meals');
    }
  }

}