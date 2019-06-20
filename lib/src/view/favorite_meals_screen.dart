import 'package:flutter/material.dart';


class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getListFavorite(),
    );
  }

  getListFavorite() {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Center(
        child: Text('Hello Favorite'),
      ),
    );
  }

}