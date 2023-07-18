import 'package:trabalho_flutter/cardapio/domain/pratos.dart';

class Cardapio {
  List<Pratos>? pratos;

  Cardapio({this.pratos});

  Cardapio.fromJson(Map<String, dynamic> json) {
    if (json['pratos'] != null) {
      pratos = <Pratos>[];
      json['pratos'].forEach((v) {
        pratos!.add(new Pratos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pratos != null) {
      data['pratos'] = this.pratos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
