import 'package:automec/pages/alterarForm.dart';
import 'package:automec/pages/inclusaoForm.dart';
import 'package:automec/pages/loginPage.dart';
import 'package:automec/pages/myHomePage.dart';
import 'package:flutter/material.dart';
import 'package:automec/pages/preLoginPage.dart';

class RouterGenerator {
  static const String preLoginPage = '/preLoginPage';
  static const String loginPage = '/loginPage';
  static const String myHomePage = '/myHomePage';
  static const String inclusaoForm = '/inclusaoForm';
  static const String  alterarForm= '/alterarForm';

  RouterGenerator._() {}
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case preLoginPage:
        return MaterialPageRoute(
          builder: (_) => PreLoginPage(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case myHomePage:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );
      case inclusaoForm:
        return MaterialPageRoute(
          builder: (_) => InclusaoForm(),
        );
      case alterarForm:
        return MaterialPageRoute(
          builder: (_) => AlterarForm(),
        );
      default:
        throw FormatException("Rota não encontrada");
    }
  }
}
