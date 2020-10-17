import 'package:dicoding_submission/src/hero/hero_animation.dart';
import 'package:dicoding_submission/src/models/meals.dart';
import 'package:dicoding_submission/src/view/detail_screen.dart';
import 'package:dicoding_submission/src/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CustomCardList extends StatelessWidget {
  final Meals meals;
  final String type;

  const CustomCardList({Key key, this.meals, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showToast(context, meals.strMeal,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 777),
              pageBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
                  DetailScreen(
                      idMeal: meals.idMeal,
                      strMeal: meals.strMeal,
                      strMealThumb: meals.strMealThumb,
                      type: type),
            ));
      },
      child: Card(
        key: Key("tap_meals_" + meals.idMeal),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: PhotoHero(
                    tag: meals.strMeal,
                    photo: meals.strMealThumb,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width / 2.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.98],
                      colors: [Colors.transparent, Colors.grey[900]])),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  meals.strMeal,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
