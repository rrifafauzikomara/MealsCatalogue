import 'package:dicoding_submission/src/resources/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/meals.dart';

class MealsDetailBloc {
  final _repository = Repository();
  final _mealsDetailFetcher = PublishSubject<MealsResult>();

  Observable<MealsResult> get detailMeals => _mealsDetailFetcher.stream;

  fetchDetailMeals(String mealsId) async {
    MealsResult mealsResult = await _repository.fetchDetailMeals(mealsId);
    _mealsDetailFetcher.sink.add(mealsResult);
  }

  dispose() {
    _mealsDetailFetcher.close();
  }
}