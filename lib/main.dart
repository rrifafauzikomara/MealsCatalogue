import 'package:flutter/material.dart';
import 'package:dicoding_submission/view/breakfast_screen.dart';
import 'package:dicoding_submission/view/desert_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dicoding_submission/models/meal.dart';
import 'package:dicoding_submission/view/detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Meals',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    String title = "The Meals";
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.free_breakfast, size: 30, color: Colors.white),
            Icon(Icons.fastfood, size: 30, color: Colors.white),
          ],
          color: Colors.blueAccent,
          buttonBackgroundColor: Colors.blueAccent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            switch (index) {
              case 0:
                setState(() {
                  _page = 0;
                });
                break;
              case 1:
                setState(() {
                  _page = 1;
                });
                break;
            }
          },
        ),
        body: _page == 0
            ? BreakfastScreen()
            : DesertScreen());
  }
}

showSnackBar(BuildContext context, Meal meal) {
  String strMeal = meal.strMeal;
  final snackBar = SnackBar(
    content: Text('Do you want to see $strMeal details ?'),
    action: SnackBarAction(
      label: 'Yes',
      onPressed: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 777),
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
                  MealDetail(meal),
            ));
      },
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
