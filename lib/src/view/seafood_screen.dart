import 'package:dicoding_submission/src/common/meals_key.dart';
import 'package:dicoding_submission/src/view/custom_card_list.dart';
import 'package:flutter/material.dart';

import '../blocs/meals_list_bloc.dart';
import '../models/meals.dart';
import 'meals_search.dart';

class SeafoodScreen extends StatefulWidget {
  @override
  SeafoodState createState() => new SeafoodState();
}

class SeafoodState extends State<SeafoodScreen> {
  final bloc = MealsBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMeals('Seafood');
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
            key: Key(KEY_TAP_SEARCH),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MealsSearch()));
            },
            backgroundColor: Colors.pinkAccent,
            child: Icon(Icons.search),
          ),
        ),
        body: getListSeafood());
  }

  getListSeafood() {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Center(
        child: StreamBuilder(
          stream: bloc.allMeals,
          builder: (context, AsyncSnapshot<MealsResult> snapshot) {
            if (snapshot.hasData) {
              return _showListSeafood(snapshot.data.meals);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
          },
        ),
      ),
    );
  }

  Widget _showListSeafood(List<Meals> meals) => GridView.builder(
        key: Key(KEY_GRID_VIEW_SEAFOOD),
        itemCount: meals == null ? 0 : meals.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: CustomCardList(
            meals: meals[index],
            type: 'seafood',
          ));
        },
      );
}
