import 'dart:convert';
import 'package:automec/models/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:automec/models/sound_class.dart';
import 'package:http/http.dart' as http;

class Cliente with ChangeNotifier {

  List<Clientes> _clientes = [];
  Clientes? _selectedCliente = null;

  get getClientes => _clientes;
  get getSelectedCliente => _selectedCliente;

  void setClientes(List<Clientes> clientes){
    this._clientes = clientes;
  }
  

  void atualizarClientes(String busca) {
    this.buscarClientes(busca);
  }


  void setSelectedCliente(int? idSelectedCliente){
    this._selectedCliente = _clientes.firstWhere((cliente) => cliente.idCliente == idSelectedCliente);
  }
  // void printInstance(){
  //   var aux = instanceClientes();
  //   print(aux);
  // }

  // void printProvider(){
  //   var aux = adicionaProvider();
  //   print(aux.runtimeType);
  // }
  List<Clientes> getSuggestions(value){
    atualizarClientes(value);
    List<Clientes> clientes = getClientes;
    return clientes;
  }

  Future<List<String>> instanceClientes() async {
    List<String> listaClient = [];
    var items = await buscarClientes('');
    items.forEach((element) {
      if(items.contains(element) == true){
        listaClient = element as List<String>;
      }
    });

    return listaClient;
  }


  List<String> adicionaProvider(){
    List<String> list = [];
    List<String> _items = instanceClientes() as List<String>;
    _items.forEach((element) {
      String item = element;
      list.add(item);
    });
    return list;
  }
  
    

  // ];

  // get items => _items;

  // get tamanho => _items.length;

  // void removeItem(int index) {
  //   _items.removeAt(index);
  //   notifyListeners();
  // }

  // SoundClass getItem(index) {
  //   return _items.elementAt(index);
  // }

  // String? getNome(int index) {
  //   return _items.elementAt(index).nome;
  // }

  // int? getNOuvintes(int index) {
  //   return _items.elementAt(index).nOuvintes;
  // }

  // String? getDuracao(int index) {
  //   return _items.elementAt(index).duracao;
  // }
  

  Future<List<Clientes>> buscarClientes(String? valor) async{
    var response = await http.get(Uri.parse('http://localhost:3000/api/clientes/${valor}'));
    var decodeProducts = json.decode(response.body);
    Map<String, dynamic> lista = decodeProducts;
    List<Clientes> listaCliente = [];
    Clientes cliente;
    //print(lista);
    try {
      lista['result'].forEach((value) { 
        cliente = Clientes();
        cliente.setIdCliente(value['idCliente']);
        cliente.setNome(value['nomeCliente']);
        cliente.setCpfCnpj(value['cpfCnpj']);
        cliente.setCelularCliente(value['celularCliente']);
        cliente.setTelefoneCliente(value['telefoneCliente']);
        cliente.setCep(value['cep']);
        cliente.setEndereco(value['endereco']);
        cliente.setNumero(value['numero']);
        cliente.setBairro(value['bairro']);
        cliente.setCidade(value['cidade']);
        cliente.setUf(value['uf']);
        cliente.setComplemento(value['complemento']);

        listaCliente.add(cliente);
    });
    } catch(error) {
      print(error);
    }
    setClientes(listaCliente);
    return listaCliente;
      
    }
}
