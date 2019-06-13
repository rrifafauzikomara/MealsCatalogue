import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/meals_list.dart';

class MealsBloc {
  final _repository = Repository();
  final _mealsFetcher = PublishSubject<MealsList>();

  Observable<MealsList> get allMeals => _mealsFetcher.stream;

  fetchAllMeals(String mealsType) async {
    MealsList mealsList = await _repository.fetchAllMeals(mealsType);
    _mealsFetcher.sink.add(mealsList);
  }

  dispose() {
    _mealsFetcher.close();
  }
}

final bloc = MealsBloc();