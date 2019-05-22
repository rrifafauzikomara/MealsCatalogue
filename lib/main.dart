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
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
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
          elevation: 0.1,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 50.0,
          items: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Icon(Icons.free_breakfast, size: 30),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Icon(Icons.fastfood, size: 30),
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
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
