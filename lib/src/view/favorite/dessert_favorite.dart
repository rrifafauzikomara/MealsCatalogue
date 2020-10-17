import 'package:dicoding_submission/src/common/meals_key.dart';
import 'package:dicoding_submission/src/models/meals.dart';
import 'package:dicoding_submission/src/resources/local/favorite_provider.dart';
import 'package:dicoding_submission/src/view/custom_card_list.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../home_screen.dart';

class DessertFavorite extends StatefulWidget {
  @override
  _DessertFavoriteState createState() => _DessertFavoriteState();
}

class _DessertFavoriteState extends State<DessertFavorite> {
  Future<List<Meals>> _dessertFavoriteFoods;

  @override
  void initState() {
    super.initState();
    _dessertFavoriteFoods =
        FavoriteProvider.db.getFavoriteMealsByType("dessert");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: FutureBuilder(
        initialData: <Meals>[],
        future: _dessertFavoriteFoods,
        builder: (BuildContext context, AsyncSnapshot<List<Meals>> snapshot) {
          if (snapshot.hasError) {
            showToast(context, snapshot.error.toString(),
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
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
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return _showListFavoriteDessert(favoriteFoods);
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

  Widget _showListFavoriteDessert(List<Meals> favoriteFoods) {
    return GridView.builder(
      key: Key(KEY_GRID_VIEW_FAVORITE_DESSERT),
      itemCount: favoriteFoods.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            child: CustomCardList(
          meals: favoriteFoods[index],
          type: 'dessert',
        ));
      },
    );
  }
}
