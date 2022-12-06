import 'dart:async';
import 'dart:convert';
// import 'package:automec/models/data.dart';
import 'package:automec/models/data.dart';
import 'package:automec/models/sound.dart';
import 'package:automec/pages/alterarForm.dart';
import 'package:automec/pages/inclusaoForm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MyHomePage extends StatefulWidget {
  
  MyHomePage({Key? key}) : super(key: key);


  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String? userSelected;

  final _textController = TextEditingController();
  String pesquisa = '';

  @override
  Widget build(BuildContext context) {
    final clienteService = Provider.of<Cliente>(context);
    clienteService.atualizarClientes('');
    return Scaffold(
      appBar: AppBar(
          title: Container(
            height: 40,
            child: Row(
              children: [
                SizedBox(width: 85),
                IconButton(
                  icon: ImageIcon(AssetImage('assets/images/logo.png')),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
                Text('Automec'),
                
              ],
            ),
          ),
          backgroundColor: Color.fromRGBO(13, 15, 54, 1),
        ),
        body: ValueListenableBuilder(
          valueListenable: Hive.box('Themedata').listenable(),
          builder: (context, box, child) {
            final isDark = box.get('isDark', defaultValue: false);
            bool isAtivo = isDark;
            return Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: TypeAheadField(
                noItemsFoundBuilder: (context) => const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text('No Item Found'),
                  ),
                ),
                suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                    color: Colors.white,
                    elevation: 4.0,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                debounceDuration: const Duration(milliseconds: 400),
                textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                          15.0,
                        )),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(13, 15, 54, 1))),
                        hintText: "Pesquisar",
                        contentPadding: const EdgeInsets.only(top: 4, left: 10),
                        hintStyle: const TextStyle(
                            color: Color.fromRGBO(13, 15, 54, 1), fontSize: 16),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search,
                                color: Color.fromRGBO(13, 15, 54, 1))),
                        fillColor: Colors.white,
                        filled: true)),
                suggestionsCallback: (value) {
                  
                  print(value);
                  
                  return clienteService.getSuggestions(value);
                  
                },
                itemBuilder: (context, Clientes suggestion) {
                  
                  return Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.refresh,
                        color: Color.fromRGBO(13, 15, 54, 1),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            suggestion.nomeCliente,
                            maxLines: 1,
                            // style: TextStyle(color: Colors.red),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  );
                },
                onSuggestionSelected: (Clientes suggestion) {
                  setState(() {
                    userSelected = suggestion.nomeCliente;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 12),
                FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  if (isAtivo == true) {
                    box.put('isDark', false);
                  } else {
                    box.put('isDark', true);
                  }
                });
              }, 
              label: isAtivo ? Text('Tema claro')
              : Text('Tema Escuro')),
              SizedBox(width: 60),
                ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(53, 61, 219, 1),
                // shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                minimumSize: Size(200, 50), //////// HERE
              ),
              onPressed: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => InclusaoForm()));
                 
              },
              child: Text('Incluir',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
              ],
            ),
            
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              height: 700,
              width: 414,
              child: FutureBuilder(
                future: getClientDataSource(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return snapshot.hasData
                      ? SfDataGrid(source: snapshot.data, columns: getColumns(), onCellTap: (details) {
                        int selectedRowIndex = details.rowColumnIndex.rowIndex;
                        // var row = snapshot.data.effectiveRows.elementAt(selectedRowIndex);

                        var idSelectedCliente = snapshot.data.getClientes[selectedRowIndex-1].getIdCliente();
                        clienteService.setSelectedCliente(idSelectedCliente);
                        Navigator.push(context,MaterialPageRoute(builder: (context) => AlterarForm()));
                        // print(getColumns());
                      },)
                      : Center(
                          child: CircularProgressIndicator(strokeWidth: 3),
                        );
                },
              ),
            ),
            
          ]
          ),
        );
        }
        ),
    );
  }

  Future<ClienteDataGridSource> getClientDataSource() async {
    var listaCliente = await listarClientes('');
    return ClienteDataGridSource(listaCliente);
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        columnName: 'ID Cliente',
        width: 45,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text('ID',
              overflow: TextOverflow.clip,
              softWrap: true,
              style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
            color: Color.fromRGBO(13, 15, 54, 1),
            borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                      ),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Nome Cliente',
        width: 200,
        label: Container(
          color: Color.fromRGBO(13, 15, 54, 1),
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text('Nome Cliente',
              overflow: TextOverflow.clip,
              softWrap: true,
              style: TextStyle(color: Colors.white)),
        ),
      ),
      GridColumn(
        columnName: 'CPF/CNPJ',
        width: 125,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text('CPF/CNPJ',
              overflow: TextOverflow.clip,
              softWrap: true,
              style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
            color: Color.fromRGBO(13, 15, 54, 1),
            borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                      ),
          ),
        ),
      ),
    ];
  }

  Future<List<Clientes>> listarClientes(String? valor) async {
    var response = await http
        .get(Uri.parse('http://localhost:3000/api/clientes/${valor}'));
    var decodeProducts = json.decode(response.body);
    Map<String, dynamic> lista = decodeProducts;
    List<Clientes> listaCliente = [];
    Clientes cliente;
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
    } catch (error) {
      print(error);
    }
    return listaCliente;
  }
}

class ClienteDataGridSource extends DataGridSource {
  ClienteDataGridSource(this.listaCliente) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Clientes> listaCliente;
  List<Clientes> get getClientes => listaCliente;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),

      ),
      Container(
        child: Text(
          row.getCells()[1].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = listaCliente.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'idCliente', value: dataGridRow.idCliente),
        DataGridCell<String>(
            columnName: 'nomeCliente', value: dataGridRow.nomeCliente),
        DataGridCell<String>(columnName: 'cpfCnpj', value: dataGridRow.cpfCnpj),
        DataGridCell<String>(
            columnName: 'celularCliente', value: dataGridRow.celularCliente),
        DataGridCell<String>(
            columnName: 'telefoneCliente', value: dataGridRow.telefoneCliente),
        DataGridCell<String>(columnName: 'cep', value: dataGridRow.cep),
        DataGridCell<String>(
            columnName: 'endereco', value: dataGridRow.endereco),
        DataGridCell<String>(columnName: 'numero', value: dataGridRow.numero),
        DataGridCell<String>(columnName: 'bairro', value: dataGridRow.bairro),
        DataGridCell<String>(columnName: 'cidade', value: dataGridRow.cidade),
        DataGridCell<String>(columnName: 'uf', value: dataGridRow.uf),
        DataGridCell<String>(
            columnName: 'complemento', value: dataGridRow.complemento),
      ]);
    }).toList(growable: false);
  }
}
