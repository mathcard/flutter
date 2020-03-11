import 'package:flutter/material.dart';

class Contato extends StatefulWidget {
  @override
  _ContatoState createState() => _ContatoState();
}

class NetImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage empresaAsset = AssetImage("images/detalhe_network.png");
    Image image = Image(
      image: empresaAsset,
      width: 100.00,
      height: 100.0,
    );
    return Container(
      child: image,
      padding: EdgeInsets.only(top: 5.0),
    );
  }
}

class _ContatoState extends State<Contato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Network"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: NetImageWidget(),
        ));
  }
}
