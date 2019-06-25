import 'package:flutter/material.dart';
import 'package:dicoding_submission/src/models/meals.dart';
import 'package:dicoding_submission/src/resources/local/favorite_provider.dart';

class SeafoodFavorite extends StatefulWidget {
  @override
  _SeafoodFavoriteState createState() => _SeafoodFavoriteState();
}

class _SeafoodFavoriteState extends State<SeafoodFavorite> {

  Future<List<Meals>> _seafoodFavoriteFoods;

  @override
  void initState() {
    super.initState();
    _seafoodFavoriteFoods = FavoriteProvider.db.getFavoriteFoodsByType("seafood");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: <Meals>[],
      future: _seafoodFavoriteFoods,
      builder:
          (BuildContext context, AsyncSnapshot<List<Meals>> snapshot) {
        if (snapshot.hasError) {
//          _scaffoldState.currentState.showSnackBar(
//            SnackBar(content: Text(snapshot.error.toString())),
//          );
          return Center(
            child: Text("Something wrong"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<Meals> favoriteFoods = snapshot.data;
          if (favoriteFoods.isEmpty) {
            return Center(
              child: Text(
                "Seafood Favorite not available",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return GridView.builder(
              itemCount: favoriteFoods.length,
              itemBuilder: (context, index) {
                Meals favoriteFood = favoriteFoods[index];
                return GestureDetector(
//                  onTap: () {
//                    _scaffoldState.currentState.showSnackBar(
//                      SnackBar(
//                        content: Text(favoriteFood.name),
//                        action: SnackBarAction(
//                          label: "Open Detail",
//                          onPressed: () => navigateToDetailScreen(
//                              context, favoriteFood, "seafood"),
//                        ),
//                      ),
//                    );
//                  },
                  child: Card(
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: favoriteFood.idMeal,
                          child: Image.network(
                            favoriteFood.strMealThumb,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: 40.0,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4.0,
                                  right: 12.0,
                                  bottom: 8.0,
                                  left: 12.0,
                                ),
                                child: Text(
                                  favoriteFood.strMeal,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

}