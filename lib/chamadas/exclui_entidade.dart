import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

Future<String> excluiEntidade(String token, int id) async {

try{
  final response = await http.delete(
    Uri.parse("https://tradicionalapi.onrender.com/deletarEntidade/$id"),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    });

  if(response.statusCode == 200){
    final json = jsonDecode(response.body);
    return json['mensagem'];
  }else{
    return "";
  }
}catch(e){
  Logger().e("Erro ao excluir entidade: $e");
  return "";
}


}