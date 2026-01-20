import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:wikictg/models/entidade_model.dart';
import 'package:wikictg/regras/converter_data.dart';
import 'package:wikictg/regras/verifica_token.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  EntidadeModel get entidade => ModalRoute.of(context)!.settings.arguments as EntidadeModel;
  bool editavel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações",),
        backgroundColor: Colors.yellow.shade700,
        titleTextStyle: GoogleFonts.cinzel(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          Visibility(
            visible: verificaToken(),
            child: Padding(
              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03),
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context){
                      return CupertinoAlertDialog(
                    title: Text("Confirmar exclusão"),
                    content: Text("Deseja excluir definitivamente a entidade ${entidade.sigla} ${entidade.nome}"),
                    actions: [
                      CupertinoDialogAction(
                        child: Text("Cancelar"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text("Excluir"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                      );
                    }
                    );
                  //Logger().i("Entidade ${entidade.id} foi deletada");
                }, 
                icon: Icon(Icons.delete),
                ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sigla: ${entidade.sigla}",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                Text(
                  "Nome: ${entidade.nome}",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Fundado: ${ConverterData.estiloBr(entidade.fundado)}",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                Text(
                  "RT: ${entidade.rt}",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cidade: ${entidade.cidade}",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Endereço: ${entidade.endereco}",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
          ],
        ),
      ), 
    );
  }
}