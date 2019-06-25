import 'package:flutter/material.dart';
import 'seafood_favorite.dart';
import 'dessert_favorite.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

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
            DessertFavorite(),
            SeafoodFavorite(),
          ],
        ),
      ),
    );
  }

}