import 'package:flutter/material.dart';


class FavoriteScreen extends StatefulWidget {
  @override
  FavoriteScreenState createState() => new FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('Hello Favorite Food'),
    );
  }

}