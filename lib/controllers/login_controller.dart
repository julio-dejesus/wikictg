import 'package:flutter/widgets.dart';
import 'package:wikictg/chamadas/gera_token.dart';
import 'package:wikictg/sharedpreferences/salva_token.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);
  String? token;
  String? _login;
    void setLogin(String login) {
    _login = login;
  }
  String? _password;
  void setPassword(String password) {
    _password = password; 
  }

  Future<bool> login() async {

    if (_login == null || _password == null) {
      return false;
    }


    inLoader.value = true;
    token = await geraToken(_login!, _password!);
    inLoader.value = false;


    if (token!.isNotEmpty) {
      await salvarToken(token!);
      return true;
    } else {
      return false;
    }
  }
}