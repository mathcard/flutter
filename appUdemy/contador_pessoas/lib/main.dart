import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(), 
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Welcome";
  
  // Function that changes the amount of person
  // Função que altera a quantidade de pessoa
  void _changePeople(int delta){
    // setState renderiza a tela novamente
    setState(() {
      _people += delta;  

      if(_people < 0){
        _infoText = "We're crazy sorry!";
      }else if(_people <=10){
        _infoText = "Welcome!";
      }else{
        _infoText = "We are crowded!";
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(              
      body: Center(
        child: Stack( // Stack, permite que widget sopbeponha outra, basta colocar dentro do children      
          children: <Widget>[
          Image.asset(
            "images/restaurant.jpg",
            fit: BoxFit.cover, // BoxFit tamanho da iagem na tela
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "People: $_people",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60,),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "+1", 
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      ),                  
                    onPressed: (){
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1", 
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                    onPressed: (){
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
          Text(
            _infoText,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 30.0),
            ),
          ],
        ),
      ],
      ),
      ),
    );
  }
}