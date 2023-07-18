import 'package:flutter/material.dart';
import 'package:trabalho_flutter/cardapio/data/data_source/restaurante_data_source.dart';
import 'package:trabalho_flutter/cardapio/presenter/view/detalhe_restaurant_view.dart';
import 'package:trabalho_flutter/cardapio/presenter/widget/appbar_widget.dart';

import '../../domain/pratos.dart';
import '../../domain/restaurante.dart';

class CadastrarPratoView extends StatefulWidget {
  final Restaurante _restaurante;
  RestauranteDataSource restauranteDataSource = RestauranteDataSource();

  CadastrarPratoView(this._restaurante);

  @override
  _CadastrarPratoViewState createState() => _CadastrarPratoViewState();
}

class _CadastrarPratoViewState extends State<CadastrarPratoView> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _ingredientesController = TextEditingController();
  final _valorController = TextEditingController();
  RestauranteDataSource service = RestauranteDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget("Cadastrar Prato"),
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
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: "Nome"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do prato.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ingredientesController,
                  decoration: InputDecoration(labelText: "Ingredientes"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira os ingredientes.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _valorController,
                  decoration: InputDecoration(labelText: "Valor"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o valor do prato.';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Pratos novoPrato = Pratos(
                          nome: _nomeController.text,
                          ingredientes: _ingredientesController.text,
                          valor: double.tryParse(_valorController.text),
                        );
                        final resultado = await service.cadastrarPrato(
                          widget._restaurante.id.toString(),
                          novoPrato,
                        );
                        if (resultado == "Prato cadastrado com sucesso!") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Cadastrado com sucesso!')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Falhou, tente novamente!')),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    child: const Text('Cadastrar Prato'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      chamarBuscar();
                    } catch (e) {
                      print('Erro ao buscar restaurante: $e');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  child: const Text('Ver Pratos Cadastrados'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chamarBuscar() async {
    Restaurante restaurante = await widget.restauranteDataSource
        .buscar(widget._restaurante.id.toString());
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalheRestauranteView(restaurante),
          ),
        );
      },
    );
  }
}
