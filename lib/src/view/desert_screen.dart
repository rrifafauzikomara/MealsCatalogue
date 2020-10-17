import 'package:dicoding_submission/src/common/meals_key.dart';
import 'package:dicoding_submission/src/view/custom_card_list.dart';
import 'package:flutter/material.dart';

import '../blocs/meals_list_bloc.dart';
import '../models/meals.dart';
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
              return _showListDessert(snapshot.data.meals);
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

  Widget _showListDessert(List<Meals> meals) => GridView.builder(
    key: Key(KEY_GRID_VIEW_DESSERT),
    itemCount: meals == null ? 0 : meals.length,
    gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        child: CustomCardList(meals: meals[index], type: 'dessert',)
      );
    },
  );

}