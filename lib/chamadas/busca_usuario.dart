import 'dart:convert';

import 'package:wikictg/models/usuarios_model.dart';
import 'package:http/http.dart' as http;


Future<List<UsuariosModel>> buscarUsuarioPorLogin(String token, String login) async{
  try{
    final response = await http.get(
      Uri.parse("https://tradicionalapi.onrender.com/listarUsuarios?login=$login"),
      headers: {
        'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
      });

    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => UsuariosModel.fromJson(e)).toList();
    }else{
      return List.empty();    }
  }catch(e){
      throw Exception('Erro ao buscar usuarios: $e');
    }
}