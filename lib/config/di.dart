import 'package:get_it/get_it.dart';
import 'package:lib/utils/interfaces/network_utils.dart';
import 'package:lib/utils/interfaces/prefs.dart';
import 'package:starwars/config/env.dart';
import 'package:starwars/detalhe/detalhe_repository_api.dart';
import 'package:starwars/detalhe/detalhe_repository_mock.dart';
import 'package:starwars/detalhe/detalhe_viewmodel.dart';
import 'package:starwars/home/home_repository_api.dart';
import 'package:starwars/home/home_repository_mock.dart';
import 'package:starwars/home/home_viewmodel.dart';

var get = GetIt.instance;

void initGetIt(Env env) async {
  bool api = env == Env.HOMOL;

  get.registerSingleton<Prefs>(SharedPrefs());

  repository(api);
  viewModel();
}

repository(bool api) {
  get
    ..registerFactory(() => api ? HomeRepositoryApi() : MockHomeRepositoryApi())
    ..registerFactory(
        () => api ? StarwarsRepositoryApi() : MockStarwarsRepository());
}

viewModel() {
  get
    ..registerFactory(() => HomeViewModel(get()))
    ..registerFactory(() => StarwarsViewModel(get()));
}
