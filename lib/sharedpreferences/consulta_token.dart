import 'package:shared_preferences/shared_preferences.dart';

Future<String?> obterTokenValido() async {
  final prefs = await SharedPreferences.getInstance();

  final token = prefs.getString('auth_token');
  final tempoToken = prefs.getInt('auth_token_expira');

  //Logger().i("token: $token; tempo do token: $tempoToken");

  if (token == null || tempoToken == null) {
    return null;
  }

  final now = DateTime.now().millisecondsSinceEpoch;

  if (now >= tempoToken) {
    await prefs.remove('auth_token');
    await prefs.remove('auth_token_expira');
    return null;
  }

  return token;
}
