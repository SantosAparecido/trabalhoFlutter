import 'package:automec/models/sound.dart';
import 'package:automec/pages/myHomePage.dart';
import 'package:automec/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AlterarForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<AlterarForm> {
  String? id = '';
  String? nomeCliente = '';
  String? cpfCnpj = '';
  String? celularCliente = '';
  String? telefoneCliente = '';
  String? cep = '';
  String? numero = '';
  String? endereco = '';
  String? bairro = '';
  String? cidade = '';
  String? uf = '';
  String? complemento = '';
  bool isAlterable = false;
  Color cor = Colors.grey;

  Future<http.Response> alterarCliente(
      int? id,
      String? nomeCliente,
      String? cpfCnpj,
      String? celularCliente,
      String? telefoneCliente,
      String? cep,
      String? numero,
      String? endereco,
      String? bairro,
      String? cidade,
      String? uf,
      String? complemento) {
    var response = http.put(
      Uri.parse('http://localhost:3000/api/cliente/$id'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        "nomeCliente": nomeCliente,
        "cpfCnpj": cpfCnpj,
        "celularCliente": celularCliente,
        "telefone": telefoneCliente,
        "cep": cep,
        "numero": numero,
        "endereco": endereco,
        "bairro": bairro,
        "cidade": cidade,
        "uf": uf,
        "complemento": complemento
      },
    );
    return response;
  }

  Future<http.Response> deleteCliente(int? id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://localhost:3000/api/cliente/$id'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    return response;
  }

  void changeAlterable(bool isAlterable) {
    this.isAlterable = isAlterable;
  }

  void changeColor(Color cor) {
    this.cor = cor;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final clienteService = Provider.of<Cliente>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: Row(
            children: [
              IconButton(
                icon: ImageIcon(AssetImage('assets/images/logo.png')),
                onPressed: () {},
              ),
              Text('Automec'),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(13, 15, 54, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text('Alterar Cliente',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child: ListTile(
                    title: Text('Nome*'),
                    subtitle: TextFormField(
                      enabled: isAlterable,
                      initialValue: clienteService.getSelectedCliente.getNome(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: cor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      maxLength: 100,
                      validator: (String? value) {
                        if (value == null) {
                          return 'Nome é Obrigatório';
                        }

                        return null;
                      },
                      onSaved: (String? value) {
                        nomeCliente = value;
                      },
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('CPF/CNPJ*'),
                    subtitle: TextFormField(
                      enabled: isAlterable,
                      initialValue:
                          clienteService.getSelectedCliente.getCpfCnpj(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: cor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null) {
                          return 'CPF/CNPJ é Obrigatório';
                        }

                        return null;
                      },
                      onSaved: (String? value) {
                        cpfCnpj = value;
                      },
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('Celular*'),
                    subtitle: TextFormField(
                      enabled: isAlterable,
                      initialValue:
                          clienteService.getSelectedCliente.getCelularCliente(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: cor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? value) {
                        if (value == null) {
                          return 'Celular é Obrigatório';
                        }

                        return null;
                      },
                      onSaved: (String? value) {
                        celularCliente = value;
                      },
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('Telefone'),
                    subtitle: TextFormField(
                      enabled: isAlterable,
                      initialValue: clienteService.getSelectedCliente
                          .getTelefoneCliente(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: cor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.url,
                      validator: (String? value) {
                        if (value == null) {
                          return 'Telefone é Obrigatório';
                        }

                        return null;
                      },
                      onSaved: (String? value) {
                        telefoneCliente = value;
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 240,
                      child: ListTile(
                        title: Text('CEP'),
                        subtitle: TextFormField(
                          enabled: isAlterable,
                          initialValue:
                              clienteService.getSelectedCliente.getCep(),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: cor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (String? value) {
                            if (value == null) {
                              return 'CEP é Obrigatório';
                            }

                            return null;
                          },
                          onSaved: (String? value) {
                            cep = value;
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 117,
                      child: ListTile(
                        title: Text('N°'),
                        subtitle: TextFormField(
                          enabled: isAlterable,
                          initialValue:
                              clienteService.getSelectedCliente.getNumero(),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: cor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (String? value) {
                            if (value == null) {
                              return 'Número é Obrigatório';
                            }

                            return null;
                          },
                          onSaved: (String? value) {
                            numero = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: ListTile(
                    title: Text('Endereço'),
                    subtitle: TextFormField(
                      enabled: isAlterable,
                      initialValue:
                          clienteService.getSelectedCliente.getEndereco(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: cor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null) {
                          return 'Endereço é Obrigatório';
                        }

                        return null;
                      },
                      onSaved: (String? value) {
                        endereco = value;
                      },
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('Bairro'),
                    subtitle: TextFormField(
                      enabled: isAlterable,
                      initialValue:
                          clienteService.getSelectedCliente.getBairro(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: cor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null) {
                          return 'Bairro é Obrigatório';
                        }

                        return null;
                      },
                      onSaved: (String? value) {
                        bairro = value;
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 270,
                      child: ListTile(
                        title: Text('Cidade'),
                        subtitle: TextFormField(
                          enabled: isAlterable,
                          initialValue:
                              clienteService.getSelectedCliente.getCidade(),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: cor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (String? value) {
                            if (value == null) {
                              return 'Cidade é Obrigatório';
                            }

                            return null;
                          },
                          onSaved: (String? value) {
                            cidade = value;
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: ListTile(
                        title: Text('UF'),
                        subtitle: TextFormField(
                          enabled: isAlterable,
                          initialValue:
                              clienteService.getSelectedCliente.getUf(),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: cor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (String? value) {
                            if (value == null) {
                              return 'UF é Obrigatório';
                            }

                            return null;
                          },
                          onSaved: (String? value) {
                            uf = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: ListTile(
                    title: Text('Complemento'),
                    subtitle: TextFormField(
                      enabled: isAlterable,
                      initialValue:
                          clienteService.getSelectedCliente.getComplemento(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: cor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null) {
                          return 'Complemento é Obrigatório';
                        }

                        return null;
                      },
                      onSaved: (String? value) {
                        complemento = value;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 105,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(53, 61, 219, 70),
                          // shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: Text('SALVAR',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();
                          alterarCliente(
                              clienteService.getSelectedCliente.getIdCliente(),
                              nomeCliente,
                              cpfCnpj,
                              celularCliente,
                              telefoneCliente,
                              cep,
                              numero,
                              endereco,
                              bairro,
                              cidade,
                              uf,
                              complemento);
                          Navigator.of(context).pop(RouterGenerator.myHomePage);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 45,
                      width: 105,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(53, 61, 219, 1),
                          // shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: Text(
                          'ALTERAR',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          setState(() {
                            changeAlterable(isAlterable = true);
                            changeColor(cor = Colors.white);
                          });
                          // changeAlterable(false);
                          // print(isAlterable);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 45,
                      width: 105,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(219, 53, 53, 1),
                          // shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: Text(
                          'EXCLUIR',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Deletar Cliente'),
                              content: Text(
                                  'Deseja realmente deletar esse cliente?',
                                  style: TextStyle(color: Colors.black)),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // SizedBox(width: 20),
                                    SizedBox(
                                      height: 40,
                                      width: 100,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'Não');
                                        },
                                        child: Text('Não',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(53, 61, 219, 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                      ),
                                    ),

                                    SizedBox(width: 10),

                                    SizedBox(
                                      height: 40,
                                      width: 100,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          deleteCliente(clienteService
                                              .getSelectedCliente
                                              .getIdCliente());
                                          Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage()));
                                        },
                                        child: Text('Sim',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(219, 53, 53, 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
