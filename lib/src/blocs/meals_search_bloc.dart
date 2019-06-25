import 'package:dicoding_submission/src/resources/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/meals.dart';

class MealsSearchBloc {

  final _repository = Repository();
  final _mealsFetcher = PublishSubject<MealsResult>();

  Observable<MealsResult> get searchMeals => _mealsFetcher.stream;

  searchAllMeals(String mealsName) async {
    MealsResult mealsResult = await _repository.searchMeals(mealsName);
    _mealsFetcher.sink.add(mealsResult);
  }

  dispose() {
    _mealsFetcher.close();
  }
}