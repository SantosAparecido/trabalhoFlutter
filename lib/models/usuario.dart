import 'package:flutter/cupertino.dart';
import './validation_usuario.dart';

class Usuario with ChangeNotifier {
  ValidationUsuario _nome = ValidationUsuario(null, null);
  ValidationUsuario _email = ValidationUsuario(null, null);
  ValidationUsuario _senha = ValidationUsuario(null, null);

  ValidationUsuario get nome => _nome;
  ValidationUsuario get email => _email;
  ValidationUsuario get senha => _senha;

  bool get isValid {
    if (_nome.value != null && _email.value != null && _senha.value != null) {
      return true;
    } else {
      setNome('');
      setEmail('');
      setSenha('');
      return false;
    }
  }

  //Setters
  void setNome(String value) {
    if (value.length >= 3) {
      _nome = ValidationUsuario(value, null);
    } else {
      _nome =
          ValidationUsuario(null, "Preencha o nome com ao menos 3 caracteres");
    }
    notifyListeners();
  }

  void setEmail(String value) {
    if (value.length >= 3) {
      _email = ValidationUsuario(value, null);
    } else {
      _email =
          ValidationUsuario(null, "Preencha o email com ao menos 3 caracteres");
    }
    notifyListeners();
  }

  void setSenha(String value) {
    if (value.length >= 3) {
      _senha = ValidationUsuario(value, null);
    } else {
      _senha =
          ValidationUsuario(null, "Preencha a senha com ao menos 3 caracteres");
    }
    notifyListeners();
  }

  void submitData() {
    print("FirstName: ${nome.value}, LastName: ${email.value}, ${senha.value}");
  }
}
