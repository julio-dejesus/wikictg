import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/web.dart';
import 'package:wikictg/regras/converter_data.dart';

class AddController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);
  String? _sigla;
  String? _nome;
  String? _fundado;
  int? _rt;
  String? _cidade;
  String? _endereco;

  void setSigla(String sigla){
    _sigla = sigla;
  }

   void setNome(String nome){
    _nome = nome;
  }

   void setFundado(String fundado){
    _fundado = fundado;
  }

   void setRt(int rt){
    _rt = rt;
  }

   void setCidade(String cidade){
    _cidade = cidade;
  }

   void setEndereco(String endereco){
    _endereco = endereco;
  }

  String testeEntidade(){
    return "sigla: $_sigla, nome: $_nome, fundado: $_fundado, rt: $_rt, cidade: $_cidade, endereco: $_endereco";
  }

  Future<String> addEntidade() async {
    try{
      final response = await http.post(
        Uri.parse("https://tradicionalapi.onrender.com/cadastroEntidades"),
        body: jsonEncode({
          "sigla": _sigla,
          "nome": _nome,
          "fundado": ConverterData.estiloAmericano(_fundado!),
          "rt": _rt,
          "cidade": _cidade,
          "endereco": _endereco
        }),
        headers: {'Content-Type': 'application/json'}
      );

      final data = jsonDecode(response.body);
      if(data['inseridas'] > 0){
        return "Sucesso.";
      }else{
        return "";
      }
    }catch(e){
      Logger().e("Erro ao adicionar entidade: $e");
      return "";
    }
  }

}