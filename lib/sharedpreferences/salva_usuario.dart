import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wikictg/models/usuarios_model.dart';

Future<void> salvarUsuarioLogado(UsuariosModel usuario) async{
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString(
    "usuario_logado", 
    jsonEncode({
      "id": usuario.id,
      "nome": usuario.nome,
      "login": usuario.login,
      "email": usuario.email,
      "admin": usuario.admin
    }),
    );


}