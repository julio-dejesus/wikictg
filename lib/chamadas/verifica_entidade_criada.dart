import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

Future<String> verificaEntidade(String token, int id) async {

try{
  final response = await http.put(
    Uri.parse("https://tradicionalapi.onrender.com/verificarEntidade/$id"),
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
  Logger().e("Erro ao verificar entidade: $e");
  return "";
}


}