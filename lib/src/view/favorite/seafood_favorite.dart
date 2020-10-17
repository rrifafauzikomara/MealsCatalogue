import 'package:dicoding_submission/src/common/meals_key.dart';
import 'package:dicoding_submission/src/models/meals.dart';
import 'package:dicoding_submission/src/resources/local/favorite_provider.dart';
import 'package:dicoding_submission/src/view/custom_card_list.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../home_screen.dart';

class SeafoodFavorite extends StatefulWidget {
  @override
  _SeafoodFavoriteState createState() => _SeafoodFavoriteState();
}

class _SeafoodFavoriteState extends State<SeafoodFavorite> {
  Future<List<Meals>> _seafoodFavoriteFoods;

  @override
  void initState() {
    super.initState();
    _seafoodFavoriteFoods =
        FavoriteProvider.db.getFavoriteMealsByType("seafood");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: FutureBuilder(
        initialData: <Meals>[],
        future: _seafoodFavoriteFoods,
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
                  "Seafood Favorite not available",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return _showListFavoriteSeafood(favoriteFoods);
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

  Widget _showListFavoriteSeafood(List<Meals> favoriteFoods) {
    return GridView.builder(
      key: Key(KEY_GRID_VIEW_FAVORITE_SEAFOOD),
      itemCount: favoriteFoods.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            child: CustomCardList(
          meals: favoriteFoods[index],
          type: 'seafood',
        ));
      },
    );
  }
}
