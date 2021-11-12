import 'package:flutter/material.dart';
import 'package:lib/imports.dart';
import 'package:starwars/config/di.dart';
import 'package:starwars/detalhe/detalhe_viewmodel.dart';
import 'package:starwars/detalhe/starwars_model.dart';

class StarwarsPage extends StatefulWidget {
  StarwarsModel starwars;

  StarwarsPage(this.starwars);

  @override
  _StarwarsPageState createState() => _StarwarsPageState();
}

class _StarwarsPageState extends State<StarwarsPage> {
  final viewModel = get<StarwarsViewModel>();

  StarwarsModel get starwars => widget.starwars;

  @override
  void initState() {
    super.initState();
    viewModel.fetch(starwars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Star Wars detalhes"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        StreamViewState(
            state: viewModel.starswars$.state,
            builder: (context, snapshot) {
              StarwarsModel p = snapshot;

              return Column(
                children: [
                  Text(
                    'Cor dos olhos: ' + p.eyeColor,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  AppLabel(
                    starwars.skinColor,
                    color: Colors.red,
                  )
                ],
              );
            })
      ],
    );
  }
}
