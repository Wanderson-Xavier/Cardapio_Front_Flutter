import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:trabalho_flutter/cardapio/domain/restaurante.dart';

import '../../../http/interceptor/logging_interceptor.dart';
import '../../domain/cardapio.dart';
import '../../domain/pratos.dart';

class RestauranteDataSource {
  static const String urlBase = '<ip>';

  Future<List<Restaurante>> buscarTodos() async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response =
          await client.get(Uri.http(urlBase, 'api/cardapio/buscarTodos'));
      final List<dynamic> decodedJson =
          jsonDecode(utf8.decode(response.bodyBytes));
      final List<Restaurante> restaurantes = [];
      for (Map<String, dynamic> restauranteJson in decodedJson) {
        final Restaurante restaurante = Restaurante.fromJson(restauranteJson);
        restaurantes.add(restaurante);
      }
      return restaurantes;
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }

  Future<Restaurante> buscar(String id) async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response = await client.get(
        Uri.http(urlBase, 'api/cardapio/buscarPorId', {'id': id}),
        headers: {
          'Content-type': 'application/json',
        },
      );
      final Map<String, dynamic> decodedJson =
          jsonDecode(utf8.decode(response.bodyBytes));
      return Restaurante.fromJson(decodedJson);
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }

  Future<Restaurante> salvar(Restaurante restaurante) async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response = await client.post(
          Uri.http(urlBase, 'api/cardapio/salvar'),
          headers: {'Content-type': 'application/json'},
          body: jsonEncode(restaurante.toJson()));
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      return Restaurante.fromJson(decodedJson);
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }

  Future<String> deletarPorCpfCnpj(String cpfCnpj) async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response = await client.delete(
          Uri.http(urlBase, 'api/cardapio/deletar', {'cpfCnpj': cpfCnpj}));
      return response.body;
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }

  Future<String> desativarPorCpfCnpj(String cpfCnpj) async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response = await client.get(
          Uri.http(urlBase, 'api/cardapio/desativar', {'cpfCnpj': cpfCnpj}));
      return response.body;
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }

  Future<List<Restaurante>> buscarPorNome(String nome) async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response = await client
          .get(Uri.http(urlBase, 'api/cardapio/buscarPorNome', {'nome': nome}));
      final List<dynamic> decodedJson = jsonDecode(response.body);
      return decodedJson.map((json) => Restaurante.fromJson(json)).toList();
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }

  Future<List<Restaurante>> buscarPorTipo(String tipo) async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response = await client
          .get(Uri.http(urlBase, 'api/cardapio/buscarPorTipo', {'Tipo': tipo}));
      final List<dynamic> decodedJson = jsonDecode(response.body);
      return decodedJson.map((json) => Restaurante.fromJson(json)).toList();
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }

  Future<Restaurante?> login(String cpfCnpj, String senha) async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response = await client.get(
        Uri.http(urlBase, 'api/cardapio/login',
            {'cpfCnpj': cpfCnpj, 'senha': senha}),
        headers: {
          'Content-type': 'application/json',
        },
      );
      final Map<String, dynamic> decodedJson =
          jsonDecode(utf8.decode(response.bodyBytes));
      return Restaurante.fromJson(decodedJson);
    } catch (e) {
      print('Erro: $e');
      return null;
    }
  }

  Future<String> recuperarAcesso(String cpfCnpj, String senha) async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response = await client.get(Uri.http(urlBase,
          'api/cardapio/recuperar', {'cpfCnpj': cpfCnpj, 'senha': senha}));
      return response.body;
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }

  Future<Cardapio> buscarPorCardapio(String cpfCnpj) async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response = await client.get(Uri.http(
          urlBase, 'api/cardapio/buscarCardapio', {'cpfCnpj': cpfCnpj}));
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      return Cardapio.fromJson(decodedJson);
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }

  Future<String> cadastrarPrato(String idRestaurante, Pratos prato) async {
    try {
      final Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);
      final Response response = await client.post(
          Uri.http(urlBase, 'api/cardapio/cadastrarPrato',
              {'idRestaurante': idRestaurante}),
          headers: {'Content-type': 'application/json'},
          body: jsonEncode(prato.toJson()));
      return response.body;
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }
}
