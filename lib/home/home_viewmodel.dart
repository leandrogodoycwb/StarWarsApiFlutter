import 'package:lib/utils/viewmodel/base_viewmodel.dart';
import 'package:starwars/home/home_repository.dart';

class HomeViewModel {
  final HomeRepository repository;

  HomeViewModel(this.repository);

  final starswars$ = BaseViewModel();

  fetch() {
    starswars$.doAsync(() => repository.getStarwarsList());
  }
}
