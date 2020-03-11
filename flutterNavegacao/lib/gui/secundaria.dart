import 'package:flutter/material.dart';

class Secundaria extends StatefulWidget{
  String msg;
  Secundaria({this.msg});
  
  @override
  _SecundariaState createState() => _SecundariaState();
}

class _SecundariaState extends State<Secundaria>{
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Secundaria"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
            (widget.msg == null ? "-" : widget.msg),  //"Segunda Tela",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black
          ),
        )
      ),
    );
  }
}