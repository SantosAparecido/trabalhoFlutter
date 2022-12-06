import 'package:automec/router/routes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InclusaoForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<InclusaoForm> {
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

  Future<http.Response> inclusaoCliente(
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
    var response = http.post(
      Uri.parse('http://localhost:3000/api/cliente/'),
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          // margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text('Incluir Novo Cliente',
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
                      decoration: const InputDecoration(
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
                      decoration: const InputDecoration(
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
                      decoration: const InputDecoration(
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
                      decoration: const InputDecoration(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 250,
                      child: ListTile(
                        title: Text('CEP'),
                        subtitle: TextFormField(
                          decoration: const InputDecoration(
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
                      width: 150,
                      child: ListTile(
                        title: Text('N°'),
                        subtitle: TextFormField(
                          decoration: const InputDecoration(
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
                      decoration: const InputDecoration(
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
                      decoration: const InputDecoration(
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
                      width: 330,
                  child: ListTile(
                    title: Text('Cidade'),
                    subtitle: TextFormField(
                      decoration: const InputDecoration(
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
                      decoration: const InputDecoration(
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
                      decoration: const InputDecoration(
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

                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(53, 61, 219, 1),
                    // shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: Size(200, 50), //////// HERE
                  ),
                  child: Text(
                    'INCLUIR',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    Navigator.of(context).pop(RouterGenerator.myHomePage);

                    _formKey.currentState!.save();
                    inclusaoCliente(
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
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
