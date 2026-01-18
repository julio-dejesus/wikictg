import 'package:flutter/material.dart';
import 'package:wikictg/models/entidade_model.dart';
import 'package:wikictg/repositories/lista_repository_imp.dart';

class HomeController {
  final ListaRepositoryImp _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<EntidadeModel>> posts = ValueNotifier<List<EntidadeModel>>([]);

  fetch() async {
    final lista = await _homeRepository.getLista();
    posts.value = List<EntidadeModel>.from(lista);
  }

  fetchComFiltro(Map<String, dynamic> filtros) async {
    final lista = await _homeRepository.getListaComFiltro(filtros);
    posts.value = List<EntidadeModel>.from(lista);
  }

}