import 'package:automec/pages/myHomePage.dart';
import 'package:flutter/material.dart';
import 'package:automec/models/usuario.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget  {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<Usuario>(context);
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/log in.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 120.0, left: 27, right: 27),
            
            child: Column(
              children: [
                Center(
                  child:Image(
                      width: 200,
                      image: AssetImage("assets/images/logoCompleto.png"),
                    ),

                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 80.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                        children: const [
                          Text(
                              style: TextStyle(
                                  fontSize: 26,
                                  //fontFamily: 'Alegreya',
                                  color: Colors.black),
                              "Login"),
                        ],
                      ),
                      ),

                      SizedBox(height: 20),

                     Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child:  Row(
                        children: const [
                          Text(
                              style: TextStyle(
                                  fontSize: 16,
                                  //fontFamily: 'Alegreya',
                                  color: Colors.black),
                              "Entre com email e senha"),
                        ],
                      ),
                     ),
                      
                      SizedBox(height: 30),

                      Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: const TextStyle(color:Colors.black),
                                decoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  hintText: 'Nome Completo',
                                  errorText: validationService.nome.error,
                                ),
                                onChanged: (String txt) {
                                  validationService.setNome(txt);
                                },
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  hintText: 'Endereço de email',
                                  errorText: validationService.email.error,
                                ),
                                onChanged: (String txt) {
                                  validationService.setEmail(txt);
                                },
                              ),
                              TextFormField(
                                obscureText: true,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  hintText: 'Digite a sua senha',
                                  errorText: validationService.senha.error,
                                ),
                                onChanged: (String txt) {
                                  validationService.setSenha(txt);
                                },
                              ),

                              SizedBox(height: 80),

                              Container(
                                margin: EdgeInsets.only(top: 50),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(53, 61, 219, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      minimumSize: Size(321, 61),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage()));
                                    },
                                    child: Text(
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.white),
                                        "Login")),
                              )
                            ],
                          ),
                        ),
                      ),
                      
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
