import 'package:flutter/material.dart';

class DadoRestauranteWidget extends StatelessWidget {
  final String? dadoRestaurante;

  const DadoRestauranteWidget({
    required this.dadoRestaurante,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Text(dadoRestaurante ?? "",
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.lightGreenAccent,
              fontSize: 17,
              fontFamily: "Nunito",
            )),
      ),
    );
  }
}
