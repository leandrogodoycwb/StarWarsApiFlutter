import 'dart:convert';

import 'package:starwars/detalhe/starwars_model.dart';
import 'package:starwars/home/home_repository.dart';
import 'package:lib/utils/http_helper.dart' as http;

class HomeRepositoryApi implements HomeRepository {
  @override
  Future getStarwarsList() async {
    var response = await http.get("https://swapi.dev/api/people/");

    Map map = json.decode(response.body);

    print(map);

    List<StarwarsModel> starswars = map['results']
        .map<StarwarsModel>((e) => StarwarsModel.fromJson(e))
        .toList();

    return starswars;
  }
}
