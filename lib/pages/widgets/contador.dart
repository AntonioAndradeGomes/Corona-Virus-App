import 'package:flutter/material.dart';

class Contador extends StatelessWidget {
  final int numero;
  final Color cor;
  final String titulo;

  Contador({this.numero, this.cor, this.titulo});

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: cor.withOpacity(.26),
          ),
          child: new Container(
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: cor,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        new Text(
          numero.toString(),
          style: new TextStyle(
            fontSize: 20,
            color: cor,
          ),
        ),
        new Text(
          titulo,
          style: new TextStyle(
            color: cor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
