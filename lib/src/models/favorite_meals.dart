import 'dart:convert';

class FavoriteMeals {
  String idMeal;
  String strMeal;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  String strIngredient5;
  String type;



  FavoriteMeals(
      {this.idMeal, this.strMeal,
        this.strCategory,
        this.strArea,
        this.strInstructions,
        this.strMealThumb,
        this.strIngredient1,
        this.strIngredient2,
        this.strIngredient3,
        this.strIngredient4,
        this.strIngredient5, this.type});

  factory FavoriteMeals.fromJson(Map<String, dynamic> json) {
    return FavoriteMeals(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strIngredient1: json['strIngredient1'],
      strIngredient2: json['strIngredient2'],
      strIngredient3: json['strIngredient3'],
      strIngredient4: json['strIngredient4'],
      strIngredient5: json['strIngredient5'],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "idMeal": idMeal,
      "strMeal": strMeal,
      "strCategory": strCategory,
      "strArea": strArea,
      "strInstructions": strInstructions,
      "strMealThumb": strMealThumb,
      "strIngredient1": strIngredient1,
      "strIngredient2": strIngredient2,
      "strIngredient3": strIngredient3,
      "strIngredient4": strIngredient4,
      "strIngredient5": strIngredient5,
      "type": type,
    };
  }

  @override
  String toString() {
    return 'FavoriteFood{idMeal: $idMeal, strMeal: $strMeal, strCategory: $strCategory, strArea: $strArea, strInstructions: $strInstructions, strMealThumb: $strMealThumb, strIngredient1: $strIngredient1, strIngredient2: $strIngredient2, strIngredient3: $strIngredient3, strIngredient4: $strIngredient4, strIngredient5: $strIngredient5, type: $type}';
  }

}

FavoriteMeals favoriteFoodFromJson(String str) {
  final data = json.decode(str);
  return FavoriteMeals.fromJson(data);
}

String favoriteFoodToJson(FavoriteMeals favoriteFood) {
  final jsonData = favoriteFood.toJson();
  return json.encode(jsonData);
}
