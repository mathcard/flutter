import 'package:flutter/material.dart';

class Servico extends StatefulWidget{
  @override
  _ServicoState createState() => _ServicoState();
}

class PhoneImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage phoneAsset = AssetImage("images/detalhe_phone.png");
    Image image = Image(image: phoneAsset, width: 100.00, height: 100.0,);
    return Container(child: image, padding: EdgeInsets.only(top: 5.0 ),);
  }
}

class _ServicoState extends State<Servico>{
  @override
  Widget build(BuildContext context){
   return Scaffold(
          appBar: AppBar(
            title: Text("Phone"),
            backgroundColor: Colors.greenAccent,
          ),
          body: Center(
          child: PhoneImageWidget(),            
      )
    );
  }
}