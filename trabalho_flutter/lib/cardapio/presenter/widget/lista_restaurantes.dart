import 'package:flutter/material.dart';
import 'package:trabalho_flutter/cardapio/domain/restaurante.dart';
import 'package:trabalho_flutter/cardapio/presenter/widget/exibeDado.dart';
import 'package:trabalho_flutter/cardapio/presenter/widget/titulo_dado_restaurante.dart';

import '../view/detalhe_restaurant_view.dart';

class RestauranteLista extends StatelessWidget {
  final Restaurante _restaurante;

  RestauranteLista(this._restaurante);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 4, top: 7),
          child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.teal, Colors.blue],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: TituloDadoRestauranteWidget(
                        tituloDadoRestaurante: "Estabelecimento"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: DadoRestauranteWidget(
                            dadoRestaurante: _restaurante.nome),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          if(_restaurante.cardapio?.pratos != null){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetalheRestauranteView(_restaurante)),
                            );
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Esse restaurante não possui cardapio!')),
                            );
                          }
                        },
                      ),
                    ],
                  )
                ],
              )),
        )
      ],
    );
  }
}
