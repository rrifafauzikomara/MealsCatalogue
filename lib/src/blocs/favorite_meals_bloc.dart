//import '../resources/repository.dart';
//import '../resources/favorite_provider.dart';
//import '../models/favorite_meals.dart';
//
//class FavoriteBloc {
//  final _repository = Repository();
//
//  void insertFavorite(String code, String name, String img) async {
//    Map<String, dynamic> row = {
//      FavoriteProvider.columnCode: code,
//      FavoriteProvider.columnName: name,
//      FavoriteProvider.columnImage: img
//    };
//
//    final id = await _repository.insertFavorite(row);
//    print('inserted row id: $id');
//  }
//
//  void deleteFav(int id) async {
//    await _repository.deleteFavorite(id);
//  }
//
//  Future<int> countData() async {
//    int count = await _repository.rowCount();
//    return count;
//  }
//
//  Future<List<FavoriteMeals>> showAllData() async {
//    final allRows = await _repository.showAllData();
//    return allRows;
//  }
//
//}
//
//final favoriteBloc = FavoriteBloc();