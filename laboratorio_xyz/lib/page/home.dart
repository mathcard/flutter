import 'package:flutter/material.dart';
import 'package:laboratorio_xyz/page/cliente.dart';
import 'package:laboratorio_xyz/page/contato.dart';
import 'package:laboratorio_xyz/page/empresa.dart';
import 'package:laboratorio_xyz/page/servico.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  void _irPara(StatefulWidget page){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    AppBar appBar = AppBar(
      title: Text("Laboratório - XYZ"),
      backgroundColor: Colors.black,
      centerTitle: true,
    );

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,  
        children: <Widget>[
          getImage("logo.png"),
          buildMenu("menu_like.png", "menu_phone.png", Curtir(), Servico()),
          buildMenu("menu_localizacao.png", "menu_network.png", Cliente(), Contato())
        ],
    );

    Container container = Container(
      padding: EdgeInsets.all(16.0),
      child: column,
    );

    return Scaffold(
      appBar: appBar,
      body: container,
      
      );
  }

  Widget buildMenu(String pathImgRight, pathImgLeft, StatefulWidget pageRight, StatefulWidget pageLeft){
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaçamento entre as imagens 
          children: <Widget>[
            GestureDetector(
              onTap: (){
                _irPara(pageRight);
              },
              child: getImage(pathImgRight),
            ),
            GestureDetector(
              onTap: (){
                _irPara(pageLeft);
              },
              child: getImage(pathImgLeft),
            ),  
          ],
      ),
    );
  }


// Colocando a pasta das imagens
  Widget getImage(String path){
    return Image.asset("images/$path");
  }

}