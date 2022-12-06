class Clientes {
  int? idCliente;
  String nomeCliente = '';
  String? cpfCnpj;
  String? celularCliente;
  String? telefoneCliente;
  String? cep;
  String? endereco;
  String? numero;
  String? bairro;
  String? cidade;
  String? uf;
  String? complemento;


  Clientes(
      {this.idCliente,
      this.nomeCliente = '',
      this.cpfCnpj,
      this.celularCliente,
      this.telefoneCliente,
      this.cep,
      this.endereco,
      this.numero,
      this.bairro,
      this.cidade,
      this.uf,
      this.complemento});

  Clientes.fromJson(Map<String, dynamic> json) {
    idCliente = json['idCliente'];
    nomeCliente = json['nomeCliente'];
    cpfCnpj = json['cpfCnpj'];
    celularCliente = json['celularCliente'];
    telefoneCliente = json['telefoneCliente'];
    cep = json['cep'];
    endereco = json['endereco'];
    numero = json['numero'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    uf = json['uf'];
    complemento = json['complemento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCliente'] = this.idCliente;
    data['nomeCliente'] = this.nomeCliente;
    data['cpfCnpj'] = this.cpfCnpj;
    data['celularCliente'] = this.celularCliente;
    data['telefoneCliente'] = this.telefoneCliente;
    data['cep'] = this.cep;
    data['endereco'] = this.endereco;
    data['numero'] = this.numero;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['uf'] = this.uf;
    data['complemento'] = this.complemento;
    return data;
  }
  
  void setIdCliente(int? idCliente) {
    this.idCliente = idCliente;
  }

  int? getIdCliente() {
    return this.idCliente;
  }

  void setNome(String nomeCliente){
    this.nomeCliente = nomeCliente;
  }

  String getNome() {
    return nomeCliente;
  }

  void setCpfCnpj(String? cpfCnpj){
    this.cpfCnpj = cpfCnpj;
  }

  String? getCpfCnpj() {
    return this.cpfCnpj;
  }

  void setCelularCliente(String? celularCliente){
    this.celularCliente = celularCliente;
  }

  String? getCelularCliente() {
    return this.celularCliente;
  }

  void setTelefoneCliente(String? telefoneCliente){
    this.telefoneCliente = telefoneCliente;
  }

  String? getTelefoneCliente() {
    return this.telefoneCliente;
  }

  void setCep(String? cep){
    this.cep = cep;
  }

  String? getCep() {
    return this.cep;
  }

  void setEndereco(String? endereco){
    this.endereco = endereco;
  }

  String? getEndereco() {
    return this.endereco;
  }

  void setNumero(String? numero){
    this.numero = numero;
  }

  String? getNumero() {
    return this.numero;
  }

  void setBairro(String? bairro){
    this.bairro = bairro;
  }

  String? getBairro() {
    return this.bairro;
  }

  void setCidade(String? cidade){
    this.cidade = cidade;
  }

  String? getCidade() {
    return this.cidade;
  }

  void setUf(String? uf){
    this.uf = uf;
  }

  String? getUf() {
    return this.uf;
  }

  void setComplemento(String? complemento){
    this.complemento = complemento;
  }

  String? getComplemento() {
    return this.complemento;
  }

}