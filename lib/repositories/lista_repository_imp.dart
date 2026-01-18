import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wikictg/models/entidade_model.dart';
import 'package:wikictg/repositories/lista_repository.dart';
import 'package:wikictg/sharedpreferences/consulta_token.dart';

class ListaRepositoryImp extends ListaRepository{

  @override
  Future<List<EntidadeModel>> getLista() async{
    try{
      var response = await http.get(Uri.parse('https://tradicionalapi.onrender.com/listarEntidades'));
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => EntidadeModel.fromJson(e)).toList();
    }
    catch(e){
      throw Exception('Erro ao buscar lista de entidades: $e');
    }
  }

  Future<List<EntidadeModel>> getListaComFiltro(Map<String, dynamic> filtros) async{
    try{
      final uri = Uri.parse('https://tradicionalapi.onrender.com/procuraEntidades').replace(
        queryParameters: filtros
      );
      var response = await http.get(uri,
      headers: {
        'Authorization': '${obterTokenValido()}',
        'Content-Type': 'application/json',
      },);
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => EntidadeModel.fromJson(e)).toList();
    }
    catch(e){
      throw Exception('Erro ao buscar lista de entidades com filtro: $e');
    }
  }
}