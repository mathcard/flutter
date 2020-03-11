import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
// TENTANDO FINALIZAR O DESAFIO
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = "0";

  void _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);

    var now = new DateTime.now();
    print("Agora é: $now");

    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });
  }

  @override
  Container containerx = Container(
    color: Colors.red,
    child: Text(
      "Atualizar",
      style: TextStyle(fontSize: 20.0, color: Colors.white),
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.jpg"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "R\$" + _preco,
                  style: TextStyle(fontSize: 35.0),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    "Atualizar",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  color: Colors.black,
                  padding: EdgeInsets.fromLTRB(30.0, 15, 30.0, 15),
                  onPressed: _recuperarPreco,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[containerx],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
