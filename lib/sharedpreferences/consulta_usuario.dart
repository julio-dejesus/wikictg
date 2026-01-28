import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> usuarioEhAdmin() async {
  final prefs = await SharedPreferences.getInstance();
  final json = prefs.getString('usuario_logado');

  if (json == null) return false;

  final data = jsonDecode(json);
  return data['admin'] == true;
}
