class Meal {
  String idMeal;
  String strMeal;
  String strInstructions;
  String strMealThumb;
  String strIngredient;

  Meal(
      {this.idMeal,
      this.strMeal,
      this.strInstructions,
      this.strMealThumb,
      this.strIngredient});

  factory Meal.fromJson(Map<String, dynamic> parsedJson) {
    String _strIngredient = parsedJson['strIngredient1'] +
        ", " +
        parsedJson['strIngredient2'] +
        ", " +
        parsedJson['strIngredient3'] +
        ", " +
        parsedJson['strIngredient4'] +
        ", " +
        parsedJson['strIngredient5'];
    return Meal(
        idMeal: parsedJson['idMeal'],
        strMeal: parsedJson['strMeal'],
        strInstructions: parsedJson['strInstructions'],
        strMealThumb: parsedJson['strMealThumb'],
        strIngredient: _strIngredient);
  }
}
