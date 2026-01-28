class UsuariosModel {
  final int id;
  final String nome;
  final String login;
  final String email;
  final bool admin;

  UsuariosModel(
    this.id,
    this.nome,
    this.login,
    this.email,
    this.admin
  );

  factory UsuariosModel.fromJson(Map<String, dynamic> json){
    return UsuariosModel(
      int.tryParse(json['id']?.toString().trim() ?? '') ?? 0, 
      json['nome']?.toString().trim() ?? '', 
      json['login']?.toString().trim() ?? '', 
      json['email']?.toString().trim() ?? '', 
      json['admin'] == true ||
      json['admin'] == 1 ||
      json['admin'] == '1' ||
      json['admin'] == 'true'
      );

  }

}