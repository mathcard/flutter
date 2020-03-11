import 'package:flutter/material.dart';

class perfilPage extends StatefulWidget {
  @override
  _perfilPageState createState() => _perfilPageState();
}

class _perfilPageState extends State<perfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("GoFlutter")),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: imagemCircular(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Coró", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
          ),
          Card(
            color: Colors.black,
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                linhaCard(
                  title: "Habilidades",
                  value: "Nenhuma",
                ),
                linhaCard(
                  title: "Idade",
                  value: "25",
                ),
                linhaCard(
                  title: "Profissao",
                  value: "Flutteiro",
                ),
                linhaCard(
                  title: "Hobbies",
                  value: "Comer",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class imagemCircular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 190,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage("assets/foto.jpg"), fit: BoxFit.fill),
      ),
    );
  }
}

class linhaCard extends StatelessWidget {

  String title;
  String value;

  linhaCard({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
