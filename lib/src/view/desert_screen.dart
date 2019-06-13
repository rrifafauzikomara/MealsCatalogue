import 'package:flutter/material.dart';
import '../models/meals_list.dart';
import '../blocs/meals_list_bloc.dart';
import '../hero/hero_animation.dart';
import 'package:dicoding_submission/src/app.dart';
import 'detail_screen.dart';


class DesertScreen extends StatefulWidget {
  @override
  DesertState createState() => new DesertState();
}

class DesertState extends State<DesertScreen> {

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMeals('Dessert');
  }

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
        child: StreamBuilder(
          stream: bloc.allMeals,
          builder: (context, AsyncSnapshot<MealsList> snapshot) {
            if (snapshot.hasData) {
              return _showListDessert(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
            ));
          },
        ),
      ),
    );
  }

  Widget _showListDessert(AsyncSnapshot<MealsList> snapshot) => GridView.builder(
    itemCount: snapshot == null ? 0 : snapshot.data.meals.length,
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
              tag: snapshot.data.meals[index].strMeal,
              onTap: () {
                showSnackBar(context, snapshot.data.meals[index].strMeal);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 777),
                      pageBuilder: (BuildContext context, Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                          DetailScreen(
                              id: snapshot.data.meals[index].idMeal),
                    ));
              },
              photo: snapshot.data.meals[index].strMealThumb,
            ),
            footer: Container(
              color: Colors.white70,
              padding: EdgeInsets.all(5.0),
              child: Text(
                snapshot.data.meals[index].strMeal,
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