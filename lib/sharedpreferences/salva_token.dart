import 'package:shared_preferences/shared_preferences.dart';

Future<void> salvarToken(String token) async {
  final prefs = await SharedPreferences.getInstance();

  final tempoToken = DateTime.now()
      .add(const Duration(hours: 3))
      .millisecondsSinceEpoch;

  await prefs.setString('auth_token', token);
  await prefs.setInt('auth_token_expira', tempoToken);
}
