import 'dart:convert';

class FavoriteMeals {
  String idMeal;
  String name;
  String thumbnail;
  String material;
  String type;

  FavoriteMeals(
      {this.idMeal, this.name, this.thumbnail, this.material, this.type});

  factory FavoriteMeals.fromJson(Map<String, dynamic> json) {
    return FavoriteMeals(
      idMeal: json["idMeal"],
      name: json["name"],
      thumbnail: json["thumbnail"],
      material: json["material"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "idMeal": idMeal,
      "name": name,
      "thumbnail": thumbnail,
      "material": material,
      "type": type,
    };
  }

  @override
  String toString() {
    return 'FavoriteFood{idMeal: $idMeal, name: $name, thumbnail: $thumbnail, material: $material, type: $type}';
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
