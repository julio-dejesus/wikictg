import 'package:flutter/material.dart';
import 'package:wikictg/pages/details_page.dart';
import 'package:wikictg/pages/filtro_page.dart';
import 'package:wikictg/pages/home_page.dart';
import 'package:wikictg/pages/login_page.dart';
import 'package:wikictg/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/start',
      routes: {
        '/start': (context) => const StartPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/filtro': (context) => FiltroPage(),
        '/details': (context) => DetailsPage(),
      },
      title: 'Wiki CTG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.yellow.shade300),
      ),
      home: StartPage(),
    );
  }
}
