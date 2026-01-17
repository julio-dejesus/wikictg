import 'package:flutter/material.dart';
import 'package:wikictg/pages/home_page.dart';
import 'package:wikictg/pages/login_page.dart';
import 'package:wikictg/sharedpreferences/consulta_token.dart';
import 'package:http/http.dart' as http;

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    _verificarSessao();
  }

  Future<void> _verificarSessao() async {
    final token = await obterTokenValido();

    final response = await http.get(Uri.parse('https://tradicionalapi.onrender.com/usoSistema'));
    print(response.body);

    if (!mounted) return;

    if (token != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
        (route) => false
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
        (route) => false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow.shade700),
          backgroundColor: Colors.yellow.shade100,
        ),
    )
    );
  }
}
