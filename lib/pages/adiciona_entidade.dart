import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wikictg/controllers/add_controller.dart';

class AdicionaEntidade extends StatefulWidget {

  const AdicionaEntidade({super.key});

  @override
  State<AdicionaEntidade> createState() => _AdicionaEntidadeState();
}

class _AdicionaEntidadeState extends State<AdicionaEntidade> {
  final AddController controller = AddController();
  bool isLoading = false;
  final dataMask = MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') },);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Entidade",),
        backgroundColor: Colors.yellow.shade700,
        titleTextStyle: GoogleFonts.cinzel(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
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
                  "Sigla:",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                    ),
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  onChanged: controller.setSigla,
                  )
                  )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nome:",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    onChanged: controller.setNome,
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                    ),
                   style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  )
                  )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Fundado:",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    onChanged: controller.setFundado,
                    inputFormatters: [dataMask],
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                    ),
                   style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  )
                  )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "RT:",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    onChanged:(value){ controller.setRt(int.parse(value)); },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                    ),
                   style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  )
                  )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cidade:",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    onChanged: controller.setCidade,
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                    ),
                   style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  )
                  )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Endereço:",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    onChanged: controller.setEndereco,
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                    ),
                   style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  )
                  ) 
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              onPressed: isLoading
              ? null
              : () async {
                setState(() {
                  isLoading = true;
                });
                Logger().i(controller.testeEntidade());
                final result = await controller.addEntidade();
                Logger().i("Tentativa de cadastro: $result");
                setState(() {
                  isLoading = false;
                });
                showCupertinoDialog(
                  context: context, 
                  builder: (context){
                    return CupertinoAlertDialog(
                      title: Text("Atenção"),
                      content: Text(result),
                      actions: [CupertinoDialogAction(
                        child: Text("Ok"),
                        onPressed: () {
                           Navigator.pop(context);
                           Navigator.pop(context);
                        }
                        )],
                    );
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
              child: isLoading
               ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.black,
                ),
               )
               : Text(
                "Adicionar",
                style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
          ],
        ),
      ), 
    );
  }
}