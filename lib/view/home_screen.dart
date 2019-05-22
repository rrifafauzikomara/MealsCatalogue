import 'package:flutter/material.dart';
import 'package:dicoding_submission/models/meal.dart';
import 'package:dicoding_submission/view/detail_screen.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  MealsPageState createState() => MealsPageState();
}

class MealsPageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String title = "The Meals";
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: getList());
  }

  getList() {
    return Container(
      child: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('data_local/meals.json'),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  List<Meal> meals = parseJson(snapshot.data);
                  return meals.isNotEmpty
                      ? _showList(context, meals)
                      : Center(child: Text("No Meal List Found.."));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  Widget _showList(BuildContext context, List<Meal> data) => GridView.builder(
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
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MealDetail(data[index])),
                      );
                    },
                    child: Image.asset(data[index].strMealThumb),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.all(0)),
                footer: Container(
                  color: Colors.white70,
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    data[index].strMeal,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent),
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
      return parsed.map<Meal>((json) => Meal.fromJson(json)).toList();
    }
  }
}
