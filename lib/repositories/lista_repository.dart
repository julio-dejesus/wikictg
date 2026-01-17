import 'package:wikictg/models/entidade_model.dart';

abstract class ListaRepository {
  Future<List<EntidadeModel>> getLista();
}