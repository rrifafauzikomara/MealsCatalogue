import 'package:flutter/material.dart';
import 'package:dicoding_submission/src/models/meals.dart';
import 'package:dicoding_submission/src/resources/local/favorite_provider.dart';
import 'package:dicoding_submission/src/hero/hero_animation.dart';
import 'package:toast/toast.dart';
import 'package:dicoding_submission/src/app.dart';
import 'package:dicoding_submission/src/view/detail_screen.dart';

class DessertFavorite extends StatefulWidget {
  @override
  _DessertFavoriteState createState() => _DessertFavoriteState();
}

class _DessertFavoriteState extends State<DessertFavorite> {

  Future<List<Meals>> _dessertFavoriteFoods;

  @override
  void initState() {
    super.initState();
    _dessertFavoriteFoods = FavoriteProvider.db.getFavoriteFoodsByType("dessert");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: FutureBuilder(
        initialData: <Meals>[],
        future: _dessertFavoriteFoods,
        builder:
            (BuildContext context, AsyncSnapshot<List<Meals>> snapshot) {
          if (snapshot.hasError) {
            showToast(context, snapshot.error.toString(), duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            return Center(
              child: Text("Something wrong"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Meals> favoriteFoods = snapshot.data;
            if (favoriteFoods.isEmpty) {
              return Center(
                child: Text(
                  "Dessert Favorite not available",
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
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      margin: EdgeInsets.all(10),
                      child: GridTile(
                        child: PhotoHero(
                          tag: favoriteFoods[index].strMeal,
                        onTap: () {
                          showToast(context, favoriteFoods[index].strMeal, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 777),
                                pageBuilder: (BuildContext context, Animation<double> animation,
                                    Animation<double> secondaryAnimation) =>
                                    DetailScreen(
                                        idMeal: favoriteFoods[index].idMeal,
                                        strMeal: favoriteFoods[index].strMeal,
                                        strMealThumb: favoriteFoods[index].strMealThumb,
                                        type: "seafood"),
                              ));
                        },
                          photo: favoriteFoods[index].strMealThumb,
                        ),
                        footer: Container(
                          color: Colors.white70,
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            favoriteFoods[index].strMeal,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.deepOrange),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}