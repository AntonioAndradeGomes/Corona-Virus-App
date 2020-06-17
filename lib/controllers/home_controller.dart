import 'package:get/get.dart';
import 'package:get_coronavirus/repository/home_repository.dart';
export 'package:get/get.dart';

class HomeController extends GetController{
  
  static HomeController get to => Get.find();

  Map<String, dynamic> coronaBrasil;

  void getCasosBrasil() async{
    Repositorio repositorio = new Repositorio();
    final response = await repositorio.requisicaoGetCasosBrasil();
    coronaBrasil = response;
    update();
  }

}