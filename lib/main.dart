import 'package:flutter/material.dart';
import 'package:lib/imports.dart';
import 'package:starwars/config/di.dart';
import 'package:starwars/config/env.dart';

import 'home/home_page.dart';

void main() async {
  get.registerSingleton<NetworkManager>(FlutterNetworkManager());
  init();
  runApp(MyApp());
}

init() async {
  initGetIt(Env.HOMOL);
  AppConfig.setEnv(Env.HOMOL);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
