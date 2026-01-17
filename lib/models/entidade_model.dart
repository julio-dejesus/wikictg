class EntidadeModel {
  final int id;
  final String sigla;
  final String nome;
  final String fundado;
  final int rt;
  final String cidade;
  final String endereco;
  final bool verificado;

  EntidadeModel(
    this.id,
    this.sigla,
    this.nome,
    this.fundado,
    this.rt,
    this.cidade,
    this.endereco,
    this.verificado,
  );

  factory EntidadeModel.fromJson(Map<String, dynamic> json) {
    return EntidadeModel(
     int.tryParse(json['id']?.toString() ?? '') ?? 0,
      json['sigla']?.toString().trim() ?? '',
      json['nome']?.toString().trim() ?? '',
      json['fundado']?.toString() ?? '',
      int.tryParse(json['rt']?.toString() ?? '') ?? 0,
      json['cidade']?.toString().trim() ?? '',
      json['endereco']?.toString().trim() ?? '',
      json['verificado'] == true ||
          json['verificado'] == 1 ||
          json['verificado'] == '1' ||
          json['verificado'] == 'true',
    );
  }


}