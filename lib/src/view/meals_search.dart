import 'package:flutter/material.dart';
import 'package:dicoding_submission/src/blocs/meals_search_bloc.dart';
import 'package:dicoding_submission/src/models/meals.dart';
import 'package:dicoding_submission/src/hero/hero_animation.dart';
import 'package:toast/toast.dart';
import 'home_screen.dart';
import 'detail_screen.dart';
import 'package:dicoding_submission/src/common/meals_key.dart';

class MealsSearch extends StatefulWidget {
  @override
  _MealsSearchState createState() => _MealsSearchState();
}

class _MealsSearchState extends State<MealsSearch> {

  final bloc = MealsSearchBloc();

  @override
  void initState() {
    super.initState();
    bloc.searchAllMeals("");
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                key: Key(KEY_TAP_BACK_BUTTON),
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              centerTitle: true,
              floating: true,
              pinned: true,
              title: TextField(
                key: Key(KEY_FIELD_SEARCH),
                autofocus: true,
                style: TextStyle(fontSize: 17, color: Colors.white),
                decoration: InputDecoration.collapsed(
                  hintText: "Meals Name...",
                  hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
                onChanged: bloc.searchAllMeals,
              ),
            )
          ];
        },
        body: getListResult(),
      ),
    );
  }

  getListResult() {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Center(
        child: StreamBuilder(
          stream: bloc.searchMeals,
          builder: (context, AsyncSnapshot<MealsResult> snapshot) {
            if (snapshot.hasData) {
              return _showListResult(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
              ));
            }
          },
        ),
      ),
    );
  }

  Widget _showListResult(AsyncSnapshot<MealsResult> snapshot) {
    return GridView.builder(
      key: Key(KEY_GRID_VIEW_SEARCH),
      itemCount: snapshot == null ? 0 : snapshot?.data?.meals?.length ?? 0,
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
                tag: snapshot.data.meals[index].strMeal,
                onTap: () {
                  showToast(context, snapshot.data.meals[index].strMeal, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 777),
                        pageBuilder: (BuildContext context, Animation<double> animation,
                            Animation<double> secondaryAnimation) =>
                            DetailScreen(
                              idMeal: snapshot.data.meals[index].idMeal,
                              strMeal: snapshot.data.meals[index].strMeal,
                              strMealThumb: snapshot.data.meals[index].strMealThumb,
                            ),
                      ));
                },
                photo: snapshot.data.meals[index].strMealThumb,
              ),
              footer: Container(
                color: Colors.white70,
                padding: EdgeInsets.all(5.0),
                child: Text(
                  snapshot.data.meals[index].strMeal,
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
  }

}