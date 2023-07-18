import 'package:flutter/material.dart';

import '../../domain/restaurante.dart';
import '../widget/appbar_widget.dart';

class DetalheRestauranteView extends StatefulWidget {
  final Restaurante _restaurante;

  DetalheRestauranteView(this._restaurante);

  @override
  _DetalheRestauranteState createState() => _DetalheRestauranteState();
}

class _DetalheRestauranteState extends State<DetalheRestauranteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(widget._restaurante.nome.toString()),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal, Colors.blue],
          ),
        ),
        child: ListView.builder(
          itemCount: widget._restaurante.cardapio?.pratos?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.lightGreenAccent,
                ),
                child: ListTile(
                  title: Text(
                    widget._restaurante.cardapio!.pratos![index].nome
                        .toString(),
                    style: const TextStyle(
                      fontFamily: "Asap",
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    'Ingredientes: ${widget._restaurante.cardapio?.pratos?[index].ingredientes}',
                    style: const TextStyle(
                      fontFamily: "Asap",
                      color: Colors.black54,
                    ),
                  ),
                  trailing: Text(
                    'R\$ ${widget._restaurante.cardapio?.pratos?[index].valor?.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontFamily: "Asap",
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
