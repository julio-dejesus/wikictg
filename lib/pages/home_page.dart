import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wikictg/controllers/home_controller.dart';
import 'package:wikictg/models/entidade_model.dart';
import 'package:wikictg/repositories/lista_repository_imp.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(ListaRepositoryImp());
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: GoogleFonts.cinzel(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )
          ),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade700,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_rounded),
            onPressed: () {
              Navigator.pushNamed(context, "/filtro");
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<EntidadeModel>>(
        valueListenable: _controller.posts,
        builder: (_, lista, _) {
          return ListView.separated(
            itemBuilder: (_, index) =>
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Center(
                  child: Text(
                    '${lista[index].sigla} ${lista[index].nome}',
                    style: GoogleFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )
                    ),
                ),
              ),
            separatorBuilder: (_, index) =>
              Divider(), 
            itemCount: lista.length,  
            );
        },
      )
    );
  }
}