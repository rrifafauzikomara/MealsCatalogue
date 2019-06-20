import 'package:dicoding_submission/src/resources/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/meals.dart';

class MealsBloc {

  final _repository = Repository();
  final _mealsFetcher = PublishSubject<MealsResult>();

  Observable<MealsResult> get allMeals => _mealsFetcher.stream;

  fetchAllMeals(String mealsType) async {
    MealsResult mealsResult = await _repository.fetchAllMeals(mealsType);
    _mealsFetcher.sink.add(mealsResult);
  }

  dispose() {
    _mealsFetcher.close();
  }
}