import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: "Calculadora IMC",
  home: Home(),
  color: Colors.greenAccent,
 
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   

  // Objetos controladores 
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  
  // Validação dos dados -> TextField vira TextFormField -> row 23, row 106 - 110, row 119
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String _infoText = "Informe seus dados.";

  // Resetando os valores
  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados."; 
      _formKey = GlobalKey<FormState>(); 
    });
    
  }

  // Calculando valores
  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text)/100;
      double imc = weight / (height * height);
      print(imc);
      if(imc < 18.6){
        _infoText = "Abaixo do Peso: ${imc.toStringAsPrecision(3)}";
      }else if(imc >= 18.6 && imc <24.9){
        _infoText = "Peso ideal: ${imc.toStringAsPrecision(3)}";
      }else if(imc >= 24.9 && imc <29.9){
        _infoText = "Levemente acima do Peso: ${imc.toStringAsPrecision(3)}";
      }else if(imc >= 29.9 && imc <34.9){
        _infoText = "Obesidade Grau I: ${imc.toStringAsPrecision(3)}";
      }else if(imc >= 34.9 && imc <39.9){
        _infoText = "Obesidade Grau II: ${imc.toStringAsPrecision(3)}";
      }else if(imc >= 40){
        _infoText = "Obesidade Grau III: ${imc.toStringAsPrecision(3)}";
      }
    });   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC",),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
          onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Trata o pixel overflow
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0) ,
        child: Form( //Criando formulário
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Vai ocupar toda a tela, exceto icone que já possui tamanho
            children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.green), // icone pessoa
            TextFormField(keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso - Weight(kg)", // placeholder
                labelStyle: TextStyle(color: Colors.greenAccent) // Cor do texto
              ),
              textAlign: TextAlign.center, // alinhamento
              style: TextStyle(color: Colors.greenAccent, fontSize: 20.0),
              controller:  weightController,
              validator: (value){ // Validando valor
                if(value.isEmpty){
                  return "Insert your weight!";
                }                
              },
            ),
            TextFormField(keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura - Height (cm)",
                labelStyle: TextStyle(color: Colors.greenAccent)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.greenAccent, fontSize: 20.0),
              controller: heightController,
              validator: (value){ // Validando valor
                if(value.isEmpty){
                  return "Insert your Height!";
                }else if(double.parse(value) > 250){
                  return "Invalid Height!";
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
              child: Container(
              height: 50.0,
                child: RaisedButton(
                  onPressed: (){
                    // Chamando a função de calcular, caso o Formulário estiver validado
                    if(_formKey.currentState.validate()){
                      _calculate();
                    }
                  },
                  child: Text("Calcular", 
                  style: TextStyle(color: Colors.white, fontSize: 25.0),),
                  color: Colors.greenAccent,                        
                ),
              ),
            ),
            Text(_infoText, textAlign: TextAlign.center,
                style: TextStyle(color: Colors.greenAccent, fontSize: 25.0),)
          ],
        ),
        ),
      ),
      
    );
  }
}