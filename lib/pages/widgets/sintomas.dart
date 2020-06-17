import 'package:flutter/material.dart';

class Sintoma extends StatelessWidget {
  final String imagem, titulo;
  Sintoma({this.imagem, this.titulo});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.28,
      height: 120,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 6,
                color: Color(0xFF4056C6).withOpacity(.15)),
          ]),
      child: new Column(
        children: <Widget>[
          Image.asset(imagem),
          new Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
