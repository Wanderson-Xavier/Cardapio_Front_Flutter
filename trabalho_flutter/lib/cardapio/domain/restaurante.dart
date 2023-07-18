import 'cardapio.dart';
import 'endereco.dart';

class Restaurante {
  String? id;
  String? nome;
  String? senha;
  String? cpfCnpj;
  Cardapio? cardapio;
  List<Enderecos>? enderecos;
  String? dtCriacao;
  String? tipoRestauranteEnum;
  bool? isAtivo;

  Restaurante(
      {this.id,
      this.nome,
      this.senha,
      this.cpfCnpj,
      this.cardapio,
      this.enderecos,
      this.dtCriacao,
      this.tipoRestauranteEnum,
      this.isAtivo});

  Restaurante.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    senha = json['senha'];
    cpfCnpj = json['cpfCnpj'];
    cardapio = json['cardapio'] != null
        ? new Cardapio.fromJson(json['cardapio'])
        : null;
    if (json['enderecos'] != null) {
      enderecos = <Enderecos>[];
      json['enderecos'].forEach((v) {
        enderecos!.add(new Enderecos.fromJson(v));
      });
    }
    dtCriacao = json['dtCriacao'];
    tipoRestauranteEnum = json['tipoRestauranteEnum'];
    isAtivo = json['isAtivo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['senha'] = this.senha;
    data['cpfCnpj'] = this.cpfCnpj;
    if (this.cardapio != null) {
      data['cardapio'] = this.cardapio!.toJson();
    }
    if (this.enderecos != null) {
      data['enderecos'] = this.enderecos!.map((v) => v.toJson()).toList();
    }
    data['dtCriacao'] = this.dtCriacao;
    data['tipoRestauranteEnum'] = this.tipoRestauranteEnum;
    data['isAtivo'] = this.isAtivo;
    return data;
  }
}
