import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdicionaEntidade extends StatefulWidget {
  const AdicionaEntidade({super.key});

  @override
  State<AdicionaEntidade> createState() => _AdicionaEntidadeState();
}

class _AdicionaEntidadeState extends State<AdicionaEntidade> {
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
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
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
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
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
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
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
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
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
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
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
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                    ),
                  )
                  ) 
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow.shade700,
                textStyle: GoogleFonts.cinzel(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              child: Text(
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