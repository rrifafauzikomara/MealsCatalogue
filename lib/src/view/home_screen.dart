import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:dicoding_submission/src/common/meals_key.dart';
import 'package:dicoding_submission/src/view/seafood_screen.dart';
import 'package:dicoding_submission/src/view/desert_screen.dart';
import 'package:dicoding_submission/src/view/favorite/home_favorite.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dicoding_submission/src/launcher/meals_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _page = 0;
  final List<Widget> _children = [
    DesertScreen(),
    SeafoodScreen(),
    FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          config.appDisplayName,
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
                    key: Key(KEY_BOTTOM_NAVIGATION),
                    index: 0,
                    height: 50.0,
                    items: <Widget>[
                      Container(
                        key: Key(KEY_BOTTOM_ITEM_DESSERT),
                        padding: EdgeInsets.all(5.0),
                        child: Icon(Icons.free_breakfast, size: 30),
                      ),
                      Container(
                        key: Key(KEY_BOTTOM_ITEM_SEAFOOD),
                        padding: EdgeInsets.all(5.0),
                        child: Icon(Icons.fastfood, size: 30),
                      ),
                      Container(
                        key: Key(KEY_BOTTOM_ITEM_FAVORITE),
                        padding: EdgeInsets.all(5.0),
                        child: Icon(Icons.favorite, size: 30),
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