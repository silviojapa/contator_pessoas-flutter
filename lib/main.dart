import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta){

    setState(() {
      _people += delta;

      if(_people < 0 ){
        _infoText = "Não Permitido!";
      } else if (_people <= 9){
        _infoText = "Pode Entrada!";
      } else{
        _infoText = "LOTADO!";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover, height: 1000,),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: FlatButton(
                      child: Text("+1",
                        style: TextStyle(
                            fontSize: 40.0, color: Colors.white),),

                      onPressed: () {_changePeople(1);},
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: FlatButton(
                      child: Text("-1",
                        style: TextStyle(
                            fontSize: 40.0, color: Colors.white),),

                      onPressed: () {_changePeople(-1);},
                    ),
                  ),
                ]),

            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold,
                  fontSize: 30.0),)
          ],
        ),
      ],
    );
  }
}
