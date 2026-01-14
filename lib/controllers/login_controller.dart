import 'package:flutter/widgets.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  String? _password;

  void setLogin(String login) {
    _login = login;
  }

  void setPassword(String password) {
    _password = password;
  }

  Future<bool> login() async {
    inLoader.value = true;
    
    await Future.delayed(Duration(seconds: 2));

    inLoader.value = false;

    // Dummy authentication logic
    if (_login == 'user' && _password == 'senha') {
      return true;
    } else {
      return false;
    }
  }
}