import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../blocs/meals_list_bloc.dart';
import '../hero/hero_animation.dart';
import 'package:dicoding_submission/src/app.dart';
import 'detail_screen.dart';
import 'package:toast/toast.dart';
import 'meals_search.dart';


class DesertScreen extends StatefulWidget {
  @override
  DesertState createState() => new DesertState();
}

class DesertState extends State<DesertScreen> {

  final bloc = MealsBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMeals('Dessert');
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 50.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MealsSearch()));
            },
            backgroundColor: Colors.pinkAccent,
            child: Icon(Icons.search),
          ),
        ),
      body: getListDesert()
    );
  }

  getListDesert() {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Center(
        child: StreamBuilder(
          stream: bloc.allMeals,
          builder: (context, AsyncSnapshot<MealsResult> snapshot) {
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

  Widget _showListDessert(AsyncSnapshot<MealsResult> snapshot) => GridView.builder(
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
                showToast(context, snapshot.data.meals[index].strMeal, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 777),
                      pageBuilder: (BuildContext context, Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                          DetailScreen(
                            idMeal: snapshot.data.meals[index].idMeal,
                            strMeal: snapshot.data.meals[index].strMeal,
                            strMealThumb: snapshot.data.meals[index].strMealThumb,
                            type: "dessert"),
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