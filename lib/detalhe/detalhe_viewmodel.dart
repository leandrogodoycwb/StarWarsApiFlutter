import 'package:lib/imports.dart';
import 'package:starwars/detalhe/detalhe_repository.dart';
import 'package:starwars/detalhe/starwars_model.dart';

class StarwarsViewModel {
  final StarwarsRepository repository;

  StarwarsViewModel(this.repository);

  final starswars$ = BaseViewModel();

  fetch(StarwarsModel starwars) {
    starswars$.doAsync(() => repository.getStarwars(starwars));
  }
}
