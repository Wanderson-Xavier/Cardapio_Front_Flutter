import 'package:flutter/material.dart';
import 'package:trabalho_flutter/cardapio/data/data_source/restaurante_data_source.dart';
import 'package:trabalho_flutter/cardapio/presenter/widget/appbar_widget.dart';

import '../../domain/restaurante.dart';
import 'cadastra_prato.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _cpfCnpjController = TextEditingController();
  final _senhaController = TextEditingController();
  RestauranteDataSource service = RestauranteDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget("Login"),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal, Colors.white24],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _cpfCnpjController,
                  decoration: InputDecoration(labelText: "CPF/CNPJ"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o CPF/CNPJ.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(labelText: "Senha"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha.';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        loginAndNavigate();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    child: Text('Entrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginAndNavigate() async {
    Restaurante? restaurante = await service.login(
      _cpfCnpjController.text,
      _senhaController.text,
    );

    if (restaurante != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logado com sucesso!')),
      );
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastrarPratoView(restaurante),
            ),
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Senha ou usuário incorreto!!')),
      );
    }
  }
}
