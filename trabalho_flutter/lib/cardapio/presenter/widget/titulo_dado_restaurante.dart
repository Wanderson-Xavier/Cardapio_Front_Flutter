import 'package:flutter/material.dart';

class TituloDadoRestauranteWidget extends StatelessWidget {
  final String? tituloDadoRestaurante;

  const TituloDadoRestauranteWidget({
    required this.tituloDadoRestaurante,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0, top: 5),
        child: Text(
          tituloDadoRestaurante ?? "",
          style: const TextStyle(
            color: Colors.deepOrangeAccent,
            fontFamily: "Nunito",
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
