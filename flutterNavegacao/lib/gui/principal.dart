import 'package:flutter/material.dart';
import 'secundaria.dart';

class Principal extends StatefulWidget{
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Principal"),
        backgroundColor: Colors.black,
      ) ,
      body: Center(
        child: RaisedButton(
          child: Text(
            "Ir para segunda tela",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          color: Colors.black,
          padding: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Secundaria(msg: "Passando um valor"),
              )  
            );
          },     
        ),
      ),
    );  
  }
}