//ui
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_coronavirus/controllers/home_controller.dart';
import 'package:get_coronavirus/pages/widgets/clipper.dart';
import 'package:get_coronavirus/pages/widgets/contador.dart';
import 'package:get_coronavirus/pages/widgets/sintomas.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new ClipPath(
              clipper: new MyClipper(),
              child: new Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 5),
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      new Color.fromARGB(255, 0, 128, 139),
                      new Color.fromARGB(255, 0, 139, 139),
                    ],
                  ),
                  image: new DecorationImage(
                    image: new AssetImage('assets/images/virus.png'),
                  ),
                ),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(height: 40,),
                    /*new IconButton(
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 30,
                      ),
                      splashColor: Colors.white,
                      onPressed: () {
                        HomeController.to.getCasosBrasil();
                      },
                      tooltip: 'Atualizar Dados',
                    ),*/
                    new Expanded(
                      child: new Stack(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/svg/Drcorona.svg",
                            width: 230,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                          new Positioned(
                            top: 50,
                            left: 150,
                            child: const Text(
                              'O método mais \neficaz de proteção é \no distanciamento.',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          new Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Text(
                        'Atualização de casos no Brasil',
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  GetBuilder<HomeController>(
                    init: HomeController(),
                    initState: (_) {
                      HomeController.to.getCasosBrasil();
                    },
                    builder: (_) {
                      if (_.coronaBrasil == null) {
                        return new Padding(
                          padding: EdgeInsets.all(20),
                          child: new Container(
                            alignment: Alignment.center,
                            child: new CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        //print(_.coronaBrasil);
                        return Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: new Text(
                                      'Atualização mais recente em: ' +
                                          _.coronaBrasil['updated_at']
                                              .toString()
                                              .substring(8, 10) +
                                          '/' +
                                          _.coronaBrasil['updated_at']
                                              .toString()
                                              .substring(5, 7) +
                                          '/' +
                                          _.coronaBrasil['updated_at']
                                              .toString()
                                              .substring(0, 4)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            new Container(
                              padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 30,
                                      color: Color(0xFFB7B7B7).withOpacity(.16),
                                    )
                                  ]),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Contador(
                                    titulo: 'Casos\nConfirmados',
                                    cor: Colors.orange,
                                    numero: _.coronaBrasil['confirmed'],
                                  ),
                                  new Contador(
                                    titulo: 'Mortes',
                                    cor: Colors.red,
                                    numero: _.coronaBrasil['deaths'],
                                  ),
                                  new Contador(
                                    titulo: 'Curados',
                                    cor: Colors.green,
                                    numero: _.coronaBrasil['recovered'],
                                  ),
                                ],
                              ),
                            ),
                            
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  new Row(
                    children: <Widget>[
                      const Text('Principais Sintomas', style: const TextStyle(fontSize: 18),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Sintoma(imagem: 'assets/images/dor_cabeca.png', titulo: 'Dor de cabeça',),
                      new Sintoma(imagem: 'assets/images/febre.png', titulo: 'Febre',),
                      new Sintoma(imagem: 'assets/images/tosse.png', titulo: 'Tosse',),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
