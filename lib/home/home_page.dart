import 'package:flutter/material.dart';
import 'package:lib/imports.dart';
import 'package:lib/utils/viewmodel/stream_view_state.dart';
import 'package:starwars/config/di.dart';
import 'package:starwars/detalhe/detalhe_page.dart';
import 'package:starwars/detalhe/starwars_model.dart';

import 'home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = get<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Star Wars"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.person),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return StreamViewState(
        state: viewModel.starswars$.state,
        builder: (_, state) {
          print(state);

          List<StarwarsModel> list = state;

          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, i) {
                StarwarsModel starwars = list[i];

                return Row(
                  children: [
                    IconButton(
                      icon: Image.asset('assets/images/avatar.png'),
                      onPressed: null,
                      iconSize: 100,
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () => _onClickStarwars(starwars),
                        child: Container(
                          color: Colors.blue[200],
                          child: Column(
                            children: [
                              Text(
                                'Nome do personagem ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              AppLabel(
                                starwars.name,
                                color: Colors.white,
                              ),
                              AppLabel(
                                  'Data de nascimento: ' + starwars.birthYear,
                                  color: Colors.white),
                              AppLabel(
                                'Peso: ' + starwars.mass,
                                color: Colors.white,
                              ),
                              AppLabel(
                                'Cor de cabelo: ' + starwars.hairColor,
                                color: Colors.white,
                              ),
                              AppLabel(
                                'Sexo: ' + starwars.gender,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              });
        });
  }

  _onClickStarwars(StarwarsModel starwars) {
    push(StarwarsPage(starwars));
  }
}
