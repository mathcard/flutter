import 'package:flutter/material.dart';

class Curtir extends StatefulWidget {
  @override
  _CurtirState createState() => _CurtirState();
}

class EmpresaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage empresaAsset = AssetImage("images/detalhe_like.png");
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

class _CurtirState extends State<Curtir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Curtir"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: EmpresaImageWidget(),
        ));
  }
}
