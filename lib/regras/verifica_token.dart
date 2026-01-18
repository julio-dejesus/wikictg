import 'package:wikictg/sharedpreferences/consulta_token.dart';

bool verificaToken(){
  dynamic token = obterTokenValido();

  if(token == ''){
    return false;
  }else{
    return true;
  }

}