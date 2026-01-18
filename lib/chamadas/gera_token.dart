import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';


Future<String> geraToken(String login, String password) async{

try{
  final response = await http.post(
    Uri.parse('https://tradicionalapi.onrender.com/logar'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'login': login,
      'senha': password,
    }),
  );

  if(response.statusCode == 200){
    final json = jsonDecode(response.body);
    return json['token'];
  }else{
    return "";
  }
}catch(e){
  Logger().e("Erro ao gerar token: $e");
  return "";
}

}