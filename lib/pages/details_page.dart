import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:wikictg/chamadas/exclui_entidade.dart';
import 'package:wikictg/chamadas/verifica_entidade_criada.dart';
import 'package:wikictg/models/entidade_model.dart';
import 'package:wikictg/regras/converter_data.dart';
import 'package:wikictg/sharedpreferences/consulta_token.dart';
import 'package:wikictg/sharedpreferences/consulta_usuario.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  EntidadeModel get entidade => ModalRoute.of(context)!.settings.arguments as EntidadeModel;
  bool admin = false;
  bool entidadeEhVerificada = false;
  String token = "";

  @override
  void initState() {
    super.initState();
    iniciaConfiguracoes();
  }

    Future<void> iniciaConfiguracoes() async{
    final isAdmin = await usuarioEhAdmin();
    final resultToken = await obterTokenValido();
    setState(() {
      admin = isAdmin;
      token = resultToken!;
      entidadeEhVerificada = entidade.verificado;
    });
    Logger().i("Usuário é admin: $admin");
  }
  
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
            visible: admin && !entidadeEhVerificada,
            child: Padding(
              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02),
              child: IconButton(
                onPressed: () {
                  final pageContext = context;
                  showDialog(
                    context: pageContext, 
                    builder: (dialogContext){
                      return CupertinoAlertDialog(
                        title: Text("Confirmar validação"),
                        content: Text("Deseja validar a entidade ${entidade.sigla} ${entidade.nome}"),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("Cancelar"),
                            onPressed: () => Navigator.pop(pageContext),
                            ),
                          CupertinoDialogAction(
                            child: Text("Confirmar"),
                            onPressed: () async{
                              if(token.isEmpty){
                                showCupertinoDialog(
                                  context: context, 
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: Text("Erro ao buscar seu token"),
                                      content: Text("Por gentileza faça o login novamente."),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: Text("Ok"), 
                                          onPressed: () {
                                            Navigator.pop(context); 
                                            Navigator.popUntil(context, (route) => route.settings.name == "/login",);
                                        },)
                                      ],
                                    );
                                  }
                                  );
                              }
                              final result = await verificaEntidade(token, entidade.id);
                              if(result.isNotEmpty && result != ""){
                                Logger().i("Entidade ${entidade.id} foi verificada");
                                showCupertinoDialog(
                                  context: pageContext, 
                                  builder: (_) {
                                    return CupertinoAlertDialog(
                                      title: Text("Atenção"),
                                      content: Text("Entidade ${entidade.id} foi verificada"),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: Text("Ok"), 
                                          onPressed: () {
                                            Navigator.pop(pageContext);
                                            Navigator.pushReplacementNamed(pageContext,"/home");
                                        },)
                                      ],
                                    );
                                  }
                                  );
                              }
                            else{
                              showCupertinoDialog(
                                  context: context, 
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: Text("Erro"),
                                      content: Text("Não foi possivel verificar a entidade ${entidade.id} verifique os Logs."),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: Text("Ok"), 
                                          onPressed: () {
                                            Navigator.pop(context); 
                                            Navigator.popUntil(context, (route) => route.settings.name == "/home",);
                                        },)
                                      ],
                                    );
                                  }
                                  );
                            } 
                            },
                            ) 
                        ],
                      );
                    }
                  );
                }, 
                icon: Icon(Icons.check_outlined)
                ),
              ),
            ),
          Visibility(
            visible: admin,
            child: Padding(
              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03),
              child: IconButton(
                onPressed: () {
                  final pageContext = context;
                  showDialog(
                    context: pageContext, 
                    builder: (dialogContext){
                      return CupertinoAlertDialog(
                    title: Text("Confirmar exclusão"),
                    content: Text("Deseja excluir definitivamente a entidade ${entidade.sigla} ${entidade.nome}"),
                    actions: [
                      CupertinoDialogAction(
                        child: Text("Cancelar"),
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text("Excluir"),
                        onPressed: () async{
                          Navigator.pop(dialogContext);
                          if(token.isEmpty){
                            showCupertinoDialog(
                              context: context, 
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text("Erro ao buscar seu token"),
                                  content: Text("Por gentileza faça o login novamente."),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: Text("Ok"), 
                                      onPressed: () {
                                        Navigator.pop(context); 
                                        Navigator.popUntil(context, (route) => route.settings.name == "/login",);
                                    },)
                                  ],
                                );
                              }
                              );
                          }
                          final result = await excluiEntidade(token, entidade.id);
                          if(result.isNotEmpty && result != ""){
                            Logger().i("Entidade ${entidade.id} foi deletada");
                            showCupertinoDialog(
                              context: pageContext, 
                              builder: (_) {
                                return CupertinoAlertDialog(
                                  title: Text("Atenção"),
                                  content: Text("Entidade ${entidade.id} foi deletada"),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: Text("Ok"), 
                                      onPressed: () {
                                        Navigator.pop(pageContext);
                                        Navigator.pushReplacementNamed(pageContext,"/home");
                                    },)
                                  ],
                                );
                              }
                              );
                          }
                        else{
                           showCupertinoDialog(
                              context: context, 
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text("Erro"),
                                  content: Text("Não foi possivel exlcuir a entidade ${entidade.id} verifique os Logs."),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: Text("Ok"), 
                                      onPressed: () {
                                        Navigator.pop(context); 
                                        Navigator.popUntil(context, (route) => route.settings.name == "/home",);
                                    },)
                                  ],
                                );
                              }
                              );
                        }
                        },
                      ),
                    ],
                      );
                    }
                    );
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