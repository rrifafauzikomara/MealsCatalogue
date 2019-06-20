import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/meals.dart';

class MealsDetailBloc {
  final _repository = Repository();
  final _mealsDetailFetcher = PublishSubject<MealsResult>();

  Observable<MealsResult> get detailMeals => _mealsDetailFetcher.stream;

  fetchDetailMeals(String mealsId) async {
    MealsResult mealsDetail = await _repository.fetchDetailMeals(mealsId);
    _mealsDetailFetcher.sink.add(mealsDetail);
  }

  dispose() {
    _mealsDetailFetcher.close();
  }
}