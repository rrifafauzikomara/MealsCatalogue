import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/meals_detail.dart';

class MealsDetailBloc {
  final _repository = Repository();
  final _mealsDetailFetcher = PublishSubject<MealsDetail>();

  Observable<MealsDetail> get detailMeals => _mealsDetailFetcher.stream;

  fetchDetailMeals(String mealsId) async {
    MealsDetail mealsDetail = await _repository.fetchDetailMeals(mealsId);
    _mealsDetailFetcher.sink.add(mealsDetail);
  }

  dispose() {
    _mealsDetailFetcher.close();
  }
}

final bloc = MealsDetailBloc();