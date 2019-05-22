import 'package:flutter/material.dart';
import 'package:dicoding_submission/models/meal.dart';
import 'package:dicoding_submission/hero/hero_animation.dart';
import 'package:dicoding_submission/main.dart';
import 'dart:convert';

class BreakfastScreen extends StatefulWidget {
  @override
  BreakfastState createState() => new BreakfastState();
}

class BreakfastState extends State<BreakfastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getListBreakfast()
    );
  }

  getListBreakfast() {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('data_local/meals_breakfast.json'),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  List<Meal> meals = parseJson(snapshot.data);
                  return meals.isNotEmpty
                      ? _showListBreakfast(context, meals)
                      : Center(child: Text("No Meal List Found.."));
                } else {
                  return Center(child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)
                  ));
                }
              } else {
                return Center(child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)
                ));
              }
            }),
      ),
    );
  }

  Widget _showListBreakfast(BuildContext context, List<Meal> data) => GridView.builder(
    itemCount: data == null ? 0 : data.length,
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
              tag: data[index].strMeal,
              onTap: () {
                showSnackBar(context, data[index]);
              },
              photo: data[index].strMealThumb,
            ),
            footer: Container(
              color: Colors.white70,
              padding: EdgeInsets.all(5.0),
              child: Text(
                data[index].strMeal,
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

  List<Meal> parseJson(String response) {
    if (response == null) {
      return [];
    } else {
      final parsed =
      json.decode(response.toString()).cast<Map<String, dynamic>>();
      return parsed.map<Meal>((json) => new Meal.fromJson(json)).toList();
    }
  }
}