import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async'; //
import 'dart:convert'; // Transformar os dados em json (json.decode)

const request = "https://api.hgbrasil.com/finance?format=json&key=b7bf55d0";

//Requisição async permite fazer requisições e não ficar esperando o resultado.
// await espera os dados chegarem.
void main() async {  
  //print(await getData());

  runApp(MaterialApp(  
  title: "Conversor de Moedas",
  home: Home(), 
  theme: ThemeData(
    hintColor: Colors.amber,
    primaryColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
    )
  )
  /*
  theme: ThemeData(
      inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
    )
  ), */
  ));
}

Future<Map> getData() async{
  http.Response response = await http.get(request);
  return json.decode(response.body);
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  
  double dolar;
  double euro;

  // Limpando todos os campos
  void _clearAll(){
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void _realChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }        
    double real = double.parse(text);
    dolarController.text = (real/dolar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }    
    double dolar = double.parse(text);
    // this.dolar representa a varivael fora da funcion
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro/dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(" \$ Conversor de Moedas \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot){
          // snapshot - Cópia, fotografia momentanea dos dados do site
          switch(snapshot.connectionState){  // Verifica o status da conexão
            case ConnectionState.none:   // Desconectado
            case ConnectionState.waiting:  // Esperando
              return Center(
                child: Text("Carregando Dados...", 
                  style: TextStyle( 
                    color: Colors.amber,
                    fontSize: 25.0,),
                textAlign: TextAlign.center,),
              );
            default: 
              if(snapshot.hasError){
                return Center(
                  child: Text("Erro... :(", 
                    style: TextStyle( 
                      color: Colors.amber,
                      fontSize: 25.0,),
                    textAlign: TextAlign.center,),
                );  
              }else{               
               // ERRO
               dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
               euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                
                 //return Container(color: Colors.green,);
                // Aconselhavel colocar sempre que utilizar texto, para teclado não tampar o texto
                return SingleChildScrollView(                 
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.monetization_on, size:150.0, color: Colors.amber),
                      // Chamando modelo de build, passando os parametros necessarios
                      buildTextField("Reais", "R\$", realController, _realChanged),
                      Divider(),
                      buildTextField("Dolares", "US\$", dolarController, _dolarChanged),
                      Divider(),
                      buildTextField("Euros", "€", euroController, _euroChanged),                                                              
                    ],
                  ),
                ); 
              }
            }
      }),
    );
  }
} 

// Criando modelo de textFiled, passando os dados que se alteram por parametro
Widget buildTextField(String label, String prefix, TextEditingController controlador, Function funcao){
  return TextField(
    controller: controlador,   // Controlador, passado por parametro, 
    decoration: InputDecoration(
      labelText: label, // Placeholder sera passado por paramtro
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(), // Borda
      prefixText: prefix     // Prefixo diferente nos campos, passado por parametro
    ),
    style: TextStyle(
      color: Colors.amber, fontSize: 25.0
    ),
    onChanged: funcao, // Função passado por parametro sera executado quando o valor for alterado
    keyboardType: TextInputType.number, // Tipo do teclado
    // keyboardType: TextInputType.numberWithOptions(decimal: true), -> PARA DECIMAL EM IOS
  );
}