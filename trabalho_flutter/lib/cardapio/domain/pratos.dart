class Pratos {
  String? nome;
  String? ingredientes;
  double? valor;

  Pratos({this.nome, this.ingredientes, this.valor});

  Pratos.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    ingredientes = json['ingredientes'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['ingredientes'] = this.ingredientes;
    data['valor'] = this.valor;
    return data;
  }
}
