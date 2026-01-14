import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wikictg/components/botao_login.dart';
import 'package:wikictg/controllers/login_controller.dart';


class LoginPage extends StatelessWidget{
  final LoginController controller = LoginController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logar'),
        centerTitle: true,
        titleTextStyle: GoogleFonts.cinzel(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.yellow.shade700,
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: Column(
          //spacing: MediaQuery.of(context).size.height * 0.05,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: MediaQuery.of(context).size.height * 0.18,
              color: Colors.yellow.shade700,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Row(
              spacing: MediaQuery.of(context).size.width * 0.05,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.login,
                  size: 40,
                  color: Colors.yellow.shade700,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Login',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: MediaQuery.of(context).size.width * 0.05,
              children: [
                Icon(
                  Icons.lock,
                  size: 40,
                  color: Colors.yellow.shade700,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            BotaoLogin(controller: controller),
          ],
        )
      )
    );
  }


}