import 'dart:convert';
import 'package:starwars/detalhe/detalhe_repository.dart';
import 'package:starwars/detalhe/starwars_model.dart';
import 'package:lib/utils/http_helper.dart' as http;

class StarwarsRepositoryApi implements StarwarsRepository {
  @override
  Future getStarwars(StarwarsModel starwars) async {
    var response = await http.get(starwars.url);

    Map map = json.decode(response.body);

    print(map);

    return StarwarsModel.fromJson(map);
  }
}
