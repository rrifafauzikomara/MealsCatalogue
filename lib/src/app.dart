import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'package:dicoding_submission/src/view/seafood_screen.dart';
import 'package:dicoding_submission/src/view/desert_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
  final List<Widget> _children = [
    DesertScreen(),
    SeafoodScreen()];

  @override
  Widget build(BuildContext context) {
    String title = "The Meals";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          _children[_page],
          Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                  data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
                  child: CurvedNavigationBar(
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
                    backgroundColor: Colors.transparent,
                    animationCurve: Curves.easeInOut,
                    animationDuration: Duration(milliseconds: 600),
                    onTap: onTabTapped,
                  )
              )
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _page = index;

    });
  }

}

void showToast(BuildContext context, String mealsName,  {int duration, int gravity}) {
  Toast.show(mealsName, context, duration: duration, gravity: gravity);
}