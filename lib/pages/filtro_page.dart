import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wikictg/chamadas/entidades_filtros.dart';

class FiltroPage extends StatefulWidget {
  const FiltroPage({super.key});

  @override
  State<FiltroPage> createState() => _FiltroPageState();
}

class _FiltroPageState extends State<FiltroPage> {
  final Map<String, dynamic> _filtro = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filtrar',
          style: GoogleFonts.cinzel(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )
          ),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade100,
      ),
      body: Container(
        color: Colors.yellow.shade100,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: TextField(
                    style: GoogleFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Sigla',
                      border: OutlineInputBorder(),
                      labelStyle: GoogleFonts.cinzel(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ), 
                    ),
                    onChanged: (value) => _filtro['sigla'] = value,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    style: GoogleFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                      labelStyle: GoogleFonts.cinzel(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ), 
                    ),
                    onChanged: (value) => _filtro['nome'] = value,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    style: GoogleFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Fundado',
                      border: OutlineInputBorder(), 
                      labelStyle: GoogleFonts.cinzel(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // onTap: () => showDatePicker(
                    //   context: context,
                    //   initialDate: DateTime.now(),
                    //   firstDate: DateTime(1800),
                    //   lastDate: DateTime.now(),
                    // ),
                    onChanged: (value) => _filtro['fundado'] = value,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: TextField(
                    style: GoogleFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: 'RT',
                      border: OutlineInputBorder(), 
                      labelStyle: GoogleFonts.cinzel(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )
                    ),
                    onChanged: (value) => _filtro['rt'] = value,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.58,
              child: TextField(
                style: GoogleFonts.cinzel(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  border: OutlineInputBorder(),
                  labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ) 
                ),
                onChanged: (value) => _filtro['cidade'] = value,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.58,
              child: TextField(
                style: GoogleFonts.cinzel(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  labelText: 'Endereço',
                  border: OutlineInputBorder(),
                  labelStyle: GoogleFonts.cinzel(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ) 
                ),
                onChanged: (value) => _filtro['endereco'] = value,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow.shade700,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                EntidadesFiltros(_filtro);
              },
              child: Text(
                'Filtrar',
                style: GoogleFonts.cinzel(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}