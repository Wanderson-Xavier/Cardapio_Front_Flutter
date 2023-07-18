import 'package:flutter/material.dart';
import 'package:trabalho_flutter/cardapio/presenter/widget/appbar_widget.dart';

import '../../data/data_source/restaurante_data_source.dart';
import '../../domain/endereco.dart';
import '../../domain/restaurante.dart';
import '../widget/tipo_restaurante.dart';

class CadastrarRestauranteView extends StatefulWidget {
  RestauranteDataSource restauranteDataSource = RestauranteDataSource();

  @override
  _CadastrarRestauranteViewState createState() =>
      _CadastrarRestauranteViewState();
}

class _CadastrarRestauranteViewState extends State<CadastrarRestauranteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Restaurante _restaurante = Restaurante();
  final List<String> _tipos = [
    'LANCHONETE',
    'RESTAURANTE',
    'PIZZARIA',
    'OUTROS'
  ];
  final Enderecos _endereco = Enderecos();
  String? _tipoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget("Cadastrar"),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal, Colors.white24],
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite o nome do restaurante.';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _restaurante.nome = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite a senha.';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _restaurante.senha = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'CPF/CNPJ'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite o CPF/CNPJ.';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _restaurante.cpfCnpj = value;
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      const Text(
                        'Tipo',
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: TipoRestaurante(
                          elementos: _tipos,
                          itemSelecionado: _tipoSelecionado,
                          onChanged: (novaModalidade) {
                            setState(() => _tipoSelecionado = novaModalidade);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 2, bottom: 2),
                  child: Text(
                    "Dados Endereço:",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                  onSaved: (String? value) {
                    _endereco.descricao = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a descrição.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Número'),
                  onSaved: (String? value) {
                    _endereco.numero = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o número.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Complemento'),
                  onSaved: (String? value) {
                    _endereco.complemento = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o Complemento.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'bairro'),
                  onSaved: (String? value) {
                    _endereco.bairro = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o bairro.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'cep'),
                  onSaved: (String? value) {
                    _endereco.cep = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o cep.';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  child: const Text('Cadastrar'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      try {
                        List<Enderecos> listEndereco = [];
                        listEndereco.add(_endereco);
                        _restaurante.enderecos = listEndereco;
                        await widget.restauranteDataSource.salvar(_restaurante);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Restaurante cadastrado com sucesso!')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Erro ao cadastrar o restaurante: $e')),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
