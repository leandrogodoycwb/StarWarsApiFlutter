import 'package:starwars/detalhe/starwars_model.dart';

abstract class StarwarsRepository {
  Future getStarwars(StarwarsModel starwars);
}
