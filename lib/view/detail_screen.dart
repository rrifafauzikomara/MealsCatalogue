import 'package:flutter/material.dart';
import 'package:dicoding_submission/models/meal.dart';

class MealDetail extends StatelessWidget {
  final Meal meal;
  MealDetail(this.meal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            meal.strMeal,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: getDetail());
  }

  getDetail() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(meal.strMealThumb),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(3.0),
              child: Text(
                meal.strMeal,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
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
                      meal.strIngredient,
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
                      meal.strInstructions,
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
