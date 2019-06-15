import 'package:flutter/material.dart';
import '../models/meals_detail.dart';
import '../blocs/meals_detail_bloc.dart';
import 'package:dicoding_submission/src/models/meals_detail.dart';

class DetailScreen extends StatefulWidget {

  final String idMeal;
  final String strMealThumb;

  const DetailScreen({Key key, @required this.idMeal, this.strMealThumb}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();

}

class _DetailScreenState extends State<DetailScreen> {

  @override
  void initState() {
    super.initState();
    bloc.fetchDetailMeals(widget.idMeal);
  }

//  @override
//  void dispose() {
//    bloc.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'Detail Meals',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: getListDetail()
    );
  }

  getListDetail() {
    return StreamBuilder(
        stream: bloc.detailMeals,
        builder: (context, AsyncSnapshot<MealsDetail> snapshot) {
          if (snapshot.hasData) {
            return _showListDetail(
                snapshot.data.meals[0].idMeal,
                snapshot.data.meals[0].strMeal,
                snapshot.data.meals[0].strMealThumb,
                snapshot.data.meals[0].strCategory,
                snapshot.data.meals[0].strArea,
                snapshot.data.meals[0].strIngredient1,
                snapshot.data.meals[0].strIngredient2,
                snapshot.data.meals[0].strIngredient3,
                snapshot.data.meals[0].strIngredient4,
                snapshot.data.meals[0].strIngredient5,
                snapshot.data.meals[0].strInstructions);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(58, 66, 86, 1.0),)
          ));
        });
  }

  Widget _showListDetail(
      String id,
      String name,
      String image,
      String category,
      String area,
      String ingredient1,
      String ingredient2,
      String ingredient3,
      String ingredient4,
      String ingredient5,
      String desc) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Hero(
            tag: name,
            child: Material(
              child: InkWell(
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(3.0),
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Category : ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    category,
                    style: TextStyle(
                        fontStyle: FontStyle.normal, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Area : ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    area,
                    style: TextStyle(
                        fontStyle: FontStyle.normal, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ingredient :",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ingredient1+ ', ' +
                        ingredient1 + ', ' +
                        ingredient2 + ', ' +
                        ingredient3 + ', ' +
                        ingredient4 + ', ' +
                        ingredient5,
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Instructions :",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    desc,
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//class DetailScreen extends StatelessWidget {
//
//  final String id;
//
//  DetailScreen({Key key, @required this.id}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    bloc.fetchDetailMeals(id);
//    return Scaffold(
//        appBar: AppBar(
//          centerTitle: true,
//          iconTheme: IconThemeData(
//            color: Colors.white,
//          ),
//          title: Text(
//            'Detail Meals',
//            style: TextStyle(color: Colors.white),
//          ),
//        ),
//        body: getListDetail()
//    );
//  }
//
//  getListDetail() {
//    return StreamBuilder(
//        stream: bloc.detailMeals,
//        builder: (context, AsyncSnapshot<MealsDetail> snapshot) {
//          if (snapshot.hasData) {
//            return _showListDetail(
//                snapshot.data.meals[0].idMeal,
//                snapshot.data.meals[0].strMeal,
//                snapshot.data.meals[0].strMealThumb,
//                snapshot.data.meals[0].strCategory,
//                snapshot.data.meals[0].strArea,
//                snapshot.data.meals[0].strIngredient1,
//                snapshot.data.meals[0].strIngredient2,
//                snapshot.data.meals[0].strIngredient3,
//                snapshot.data.meals[0].strIngredient4,
//                snapshot.data.meals[0].strIngredient5,
//                snapshot.data.meals[0].strInstructions);
//          } else if (snapshot.hasError) {
//            return Text(snapshot.error.toString());
//          }
//          return Center(child: CircularProgressIndicator(
//              valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(58, 66, 86, 1.0),)
//          ));
//        });
//  }
//
//  Widget _showListDetail(
//      String id,
//      String name,
//      String image,
//      String category,
//      String area,
//      String ingredient1,
//      String ingredient2,
//      String ingredient3,
//      String ingredient4,
//      String ingredient5,
//      String desc) {
//    return SingleChildScrollView(
//      child: Column(
//        children: <Widget>[
//          Hero(
//            tag: name,
//            child: Material(
//              child: InkWell(
//                child: Image.network(image, fit: BoxFit.cover),
//              ),
//            ),
//          ),
//          Container(
//            alignment: Alignment.center,
//            padding: EdgeInsets.all(3.0),
//            child: Text(
//              name,
//              style: TextStyle(
//                  fontSize: 17,
//                  fontWeight: FontWeight.bold,
//                  color: Colors.black),
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.all(5.0),
//            child: Row(
//              children: <Widget>[
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Text(
//                    "Category : ",
//                    style: TextStyle(
//                        fontSize: 15,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.black),
//                  ),
//                ),
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Text(
//                    category,
//                    style: TextStyle(
//                        fontStyle: FontStyle.normal, color: Colors.black),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.all(5.0),
//            child: Row(
//              children: <Widget>[
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Text(
//                    "Area : ",
//                    style: TextStyle(
//                        fontSize: 15,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.black),
//                  ),
//                ),
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Text(
//                    area,
//                    style: TextStyle(
//                        fontStyle: FontStyle.normal, color: Colors.black),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.all(5.0),
//            child: Column(
//              children: <Widget>[
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Text(
//                    "Ingredient :",
//                    style: TextStyle(
//                        fontSize: 15,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.black),
//                  ),
//                ),
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Text(
//                    ingredient1+ ', ' +
//                        ingredient1 + ', ' +
//                        ingredient2 + ', ' +
//                        ingredient3 + ', ' +
//                        ingredient4 + ', ' +
//                        ingredient5,
//                    style: TextStyle(
//                        fontStyle: FontStyle.italic, color: Colors.black),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.all(5.0),
//            child: Column(
//              children: <Widget>[
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Text(
//                    "Instructions :",
//                    style: TextStyle(
//                        fontSize: 15,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.black),
//                  ),
//                ),
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Text(
//                    desc,
//                    style: TextStyle(
//                        fontStyle: FontStyle.italic, color: Colors.black),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//}