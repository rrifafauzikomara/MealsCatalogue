import 'package:flutter/material.dart';
import '../models/meals_detail.dart';
import '../blocs/meals_detail_bloc.dart';
import 'package:dicoding_submission/src/models/meals_detail.dart';

class DetailScreen extends StatefulWidget {

  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  const DetailScreen({Key key, @required this.idMeal, this.strMeal, this.strMealThumb}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();

}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin{

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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 270,
              floating: false,
              pinned: true,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.strMeal,
                  child: Material(
                    child: InkWell(
                      child: Image.network(
                          widget.strMealThumb,
                          width: double.infinity,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: getListDetail(),
      ),
    );
  }

  getListDetail() {
    return StreamBuilder(
        stream: bloc.detailMeals,
        builder: (context, AsyncSnapshot<MealsDetail> snapshot) {
          if (snapshot.hasData) {
            return _showListDetail(
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
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(3.0),
            child: Text(
              widget.strMeal,
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