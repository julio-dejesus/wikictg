import 'package:flutter/widgets.dart';
import 'package:wikictg/chamadas/busca_usuario.dart';
import 'package:wikictg/chamadas/gera_token.dart';
import 'package:wikictg/sharedpreferences/salva_token.dart';
import 'package:wikictg/sharedpreferences/salva_usuario.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);
  String? token;
  String? _login;
  String? _password;

  void setLogin(String login) {
    _login = login;
  }

  void setPassword(String password) {
    _password = password; 
  }

  Future<bool> login() async {

    if (_login == null || _password == null) {
      return false;
    }

    inLoader.value = true;
    token = await geraToken(_login!, _password!);

    if (token == null || token!.isEmpty) {
      inLoader.value = false;
      return false;
    }

    await salvarToken(token!);

    final usuarios = await buscarUsuarioPorLogin(token!,_login!,);

    if (usuarios.isEmpty) {
      inLoader.value = false;
      return false;
    }

    final usuarioLogado = usuarios.first;
    await salvarUsuarioLogado(usuarioLogado);

    inLoader.value = false;
    return true;
  }
}