import 'package:flutter/material.dart';

class Cliente extends StatefulWidget {
  @override
  _ClienteState createState() => _ClienteState();
}

class LocImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage empresaAsset = AssetImage("images/detalhe_localizacao.png");
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

class _ClienteState extends State<Cliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Localização"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: LocImageWidget(),
        ));
  }
}
