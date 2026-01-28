class ConverterData {
  
  static String estiloAmericano(String data){
        if (data.length < 10) {
      return data;
    }
    String dia = data.substring(0, 2);
    String mes = data.substring(3, 5);
    String ano = data.substring(6, 10);

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
