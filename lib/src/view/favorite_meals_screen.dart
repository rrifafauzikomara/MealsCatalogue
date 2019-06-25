import 'package:flutter/material.dart';
import 'package:dicoding_submission/src/models/favorite_meals.dart';
import 'package:dicoding_submission/src/resources/local/favorite_provider.dart';
import 'package:dicoding_submission/src/view/detail_screen.dart';


class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  Future<List<FavoriteMeals>> _dessertFavoriteFoods;
  Future<List<FavoriteMeals>> _seafoodFavoriteFoods;

  @override
  void initState() {
    super.initState();
    _dessertFavoriteFoods = FavoriteProvider.db.getFavoriteFoodsByType("dessert");
    _seafoodFavoriteFoods = FavoriteProvider.db.getFavoriteFoodsByType("seafood");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Color.fromRGBO(58, 66, 86, 1.0),
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: "Dessert",
                ),
                Tab(
                  text: "Seafood",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _buildWidgetDessertFavorite(),
            _buildWidgetSeafoodFavorite(),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetDessertFavorite() {
    return FutureBuilder(
      initialData: <FavoriteMeals>[],
      future: _dessertFavoriteFoods,
      builder:
          (BuildContext context, AsyncSnapshot<List<FavoriteMeals>> snapshot) {
        if (snapshot.hasError) {
//          _scaffoldState.currentState.showSnackBar(
//            SnackBar(content: Text(snapshot.error.toString())),
//          );
          return Center(
            child: Text("Something wrong"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<FavoriteMeals> favoriteFoods = snapshot.data;
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
              itemBuilder: (context, index) {
                FavoriteMeals favoriteFood = favoriteFoods[index];
                return GestureDetector(
//                  onTap: () {
//                    _scaffoldState.currentState.showSnackBar(
//                      SnackBar(
//                        content: Text(favoriteFood.name),
//                        action: SnackBarAction(
//                          label: "Open Detail",
//                          onPressed: () => navigateToDetailScreen(
//                              context, favoriteFood, "dessert"),
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
                            favoriteFood.thumbnail,
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
                                  favoriteFood.name,
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

  Future navigateToDetailScreen(
      BuildContext context, FavoriteMeals favoriteFood, String type) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          idMeal: favoriteFood.idMeal,
          strMealThumb: favoriteFood.thumbnail,
          strMeal: favoriteFood.name,
          type: type,
        ),
      ),
    );

    if (result) {
      if (type == "dessert") {
        _dessertFavoriteFoods = FavoriteProvider.db.getFavoriteFoodsByType("dessert");
      } else {
        _seafoodFavoriteFoods = FavoriteProvider.db.getFavoriteFoodsByType("seafood");
      }
      setState(() {});
    }
  }

  Widget _buildWidgetSeafoodFavorite() {
    return FutureBuilder(
      initialData: <FavoriteMeals>[],
      future: _seafoodFavoriteFoods,
      builder:
          (BuildContext context, AsyncSnapshot<List<FavoriteMeals>> snapshot) {
        if (snapshot.hasError) {
//          _scaffoldState.currentState.showSnackBar(
//            SnackBar(content: Text(snapshot.error.toString())),
//          );
          return Center(
            child: Text("Something wrong"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<FavoriteMeals> favoriteFoods = snapshot.data;
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
                FavoriteMeals favoriteFood = favoriteFoods[index];
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
                            favoriteFood.thumbnail,
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
                                  favoriteFood.name,
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