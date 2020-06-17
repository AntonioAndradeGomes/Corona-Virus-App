//comunicação com a api r
import 'package:dio/dio.dart';

class Repositorio {
  Future<Map<String, dynamic>> requisicaoGetCasosBrasil() async {
    //print('Chamou get filial');
    try {
      Dio dio = new Dio();
      String url = 'https://covid19-brazil-api.now.sh/api/report/v1/brazil';
      Response resposta = await dio.get(url);
      return resposta.data["data"];
    } catch (e) {
      return {'Erro': e};
    }
  }

}
