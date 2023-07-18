import 'package:flutter/material.dart';
import 'package:trabalho_flutter/cardapio/data/data_source/restaurante_data_source.dart';
import 'package:trabalho_flutter/cardapio/presenter/widget/appbar_widget.dart';
import 'package:trabalho_flutter/cardapio/presenter/widget/lista_restaurantes.dart';

import '../../domain/restaurante.dart';

class RestauranteView extends StatefulWidget {
  RestauranteDataSource restauranteDataSource = RestauranteDataSource();

  @override
  _RestauranteViewState createState() => _RestauranteViewState();
}

class _RestauranteViewState extends State<RestauranteView> {
  List<Restaurante> _restaurantes = [];

  @override
  void initState() {
    super.initState();
    widget.restauranteDataSource
        .buscarTodos()
        .then((restaurantes) => setState(() {
              _restaurantes = restaurantes;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget("Restaurantes"),
      body: FutureBuilder<List<Restaurante>>(
        initialData: _restaurantes,
        future: widget.restauranteDataSource.buscarTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando..."),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Restaurante> restaurantes = snapshot.data!;
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.lightGreenAccent, Colors.white24],
                  ),
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final Restaurante restaurante = restaurantes[index];
                    return RestauranteLista(restaurante);
                  },
                  itemCount: restaurantes.length,
                ),
              );
              break;
          }
          return Text("Erro");
        },
      ),
    );
  }
}
