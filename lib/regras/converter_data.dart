class ConverterData {
  
  static String estiloAmericano(String data){
    String dia = data.substring(0, 2);
    String mes = data.substring(2, 4);
    String ano = data.substring(4, 8);

    return '$ano-$mes-$dia';
  }

  static String estiloBr(String data){
    if (data.length < 8) {
      return data;
    }
    String ano = data.substring(0, 4);
    String mes = data.substring(5, 7);
    String dia = data.substring(8, 10);

    return '$dia/$mes/$ano';
  }
}
