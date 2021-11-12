import 'package:starwars/detalhe/detalhe_repository.dart';
import 'package:starwars/detalhe/starwars_model.dart';

class MockStarwarsRepository implements StarwarsRepository {
  @override
  Future getStarwars(StarwarsModel starswars) {
    throw UnimplementedError();
  }
}
