import 'package:flutter/material.dart';

import 'cardapio/presenter/view/tela_inicial.dart';

void main() {
  runApp(RestauranteApp());
}

class RestauranteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blue[800], // Your accent color
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[800],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: telaInicial(),
    );
  }
}
