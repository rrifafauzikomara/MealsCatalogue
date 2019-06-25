import 'package:flutter/material.dart';

class MealsSearch extends StatefulWidget {
  @override
  _MealsSearchState createState() => _MealsSearchState();
}

class _MealsSearchState extends State<MealsSearch> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getListDesert()
    );
  }

  getListDesert() {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Center(
        child: Text('Search View'),
      ),
    );
  }

}