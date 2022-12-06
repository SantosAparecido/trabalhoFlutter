import 'dart:html';
import 'package:automec/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


class PreLoginPage extends StatelessWidget {
    const PreLoginPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(17.0), bottomLeft: Radius.circular(17.0)),
                image: DecorationImage(
                  image: AssetImage('assets/images/figma3.jpg'),
                  fit: BoxFit.cover
                ),
          ),
        child:  Column(
                children: [
                  SizedBox(height: 580),
                  Text('Automec', style: TextStyle(fontSize: 36, color: Colors.white),),
                  Text('Oficina Inteligente', style: TextStyle(fontSize: 24, color: Colors.white),),
                  SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(53, 61, 219, 1),
                      // shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: Size(280, 67), //////// HERE
                    ),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
                    }, 
                    child: Text('Logar-se',style: TextStyle(fontSize: 24, color: Colors.white))
                    ),
                ],
              ),
        ),
      );
  }
}