class Enderecos {
  String? descricao;
  String? numero;
  String? complemento;
  String? bairro;
  String? cep;
  int? codigoTipoEndereco;
  String? descricaoTipoEndereco;
  int? idTipoLogradouro;
  int? idLocalidade;

  Enderecos(
      {this.descricao,
      this.numero,
      this.complemento,
      this.bairro,
      this.cep,
      this.codigoTipoEndereco,
      this.descricaoTipoEndereco,
      this.idTipoLogradouro,
      this.idLocalidade});

  Enderecos.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    numero = json['numero'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    cep = json['cep'];
    codigoTipoEndereco = json['codigoTipoEndereco'];
    descricaoTipoEndereco = json['descricaoTipoEndereco'];
    idTipoLogradouro = json['idTipoLogradouro'];
    idLocalidade = json['idLocalidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['cep'] = this.cep;
    data['codigoTipoEndereco'] = this.codigoTipoEndereco;
    data['descricaoTipoEndereco'] = this.descricaoTipoEndereco;
    data['idTipoLogradouro'] = this.idTipoLogradouro;
    data['idLocalidade'] = this.idLocalidade;
    return data;
  }
}
