class Cliente {
  int? id;
  String? nome;
  String? email;
  String? cidade;
  String? tel;
  String? estado;
  String? imgPerfil;

  Cliente(
      {this.id,
      this.nome,
      this.email,
      this.cidade,
      this.tel,
      this.estado,
      this.imgPerfil});

  Cliente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    cidade = json['cidade'];
    tel = json['tel'];
    estado = json['estado'];
    imgPerfil = json['imgPerfil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    data['cidade'] = cidade;
    data['tel'] = tel;
    data['estado'] = estado;
    data['imgPerfil'] = imgPerfil;
    return data;
  }
}
