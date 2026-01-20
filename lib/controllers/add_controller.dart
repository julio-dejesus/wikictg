import 'package:flutter/material.dart';

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

  Future<String> addEntidade() async {

    return "";
  }

}