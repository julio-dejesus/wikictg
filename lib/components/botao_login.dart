import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wikictg/controllers/login_controller.dart';

class BotaoLogin extends StatelessWidget {
  final LoginController controller;
  const BotaoLogin({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.inLoader, 
      builder: (_, inLoader, _) => inLoader ? CircularProgressIndicator() : ElevatedButton(
        onPressed: () {
          controller.login().then(
            (result){
              if(result){
                //Navigator.pushReplacementNamed(context, '/home');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login realizado com sucesso!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login ou senha incorretos!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            }
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow.shade700,
          textStyle: GoogleFonts.cinzel(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        child: Text('Entrar'),
      ),
    );
  }

}