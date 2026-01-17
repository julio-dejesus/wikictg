import 'package:http/http.dart' as http;

void EntidadesFiltros (Map<String, dynamic> filtros) async{
  
  try{
    final uri = Uri.parse('https://tradicionalapi.onrender.com/procuraEntidades').replace(
      queryParameters: filtros
    );
    print(uri);
    print(uri.toString());
    final result = await http.get(uri);
    print(result.body);
  }
  catch(e){
    print(e);
  }


}