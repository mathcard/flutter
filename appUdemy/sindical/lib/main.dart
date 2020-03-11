import 'package:flutter/material.dart';
//import 'package:flutter_masked_text/flutter_masked_text.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

// COMO ENVIAR DADOS JSON

void main() => runApp(MaterialApp(
  title: "Sindical",
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController(text: "000.000.000-00");
  TextEditingController foneController = TextEditingController(/*text: "(00)0 0000-0000"*/);
  TextEditingController emailController = TextEditingController();
  
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();        
    
  @override

  void salvar(){
    String nome = nomeController.text;
    String cpf = cpfController.text;
    String fone = foneController.text;
    String email = emailController.text;
    print("N:${nome}, C:${cpf}, F:${fone}, E:${email}");

    /*
  Firestore db = Firestore.instance;
  DocumentReference ref = await db.collection("usuarios")  
  .add({"nome":"Deia", "idade":"27"});  */
}

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Math"),
          backgroundColor: Colors.green,     
        ),
        body: SingleChildScrollView(                 
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Container(                          
              color: Colors.cyan,
              width: 800,
              padding: EdgeInsets.all(30),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.monetization_on, size:150.0, color: Colors.amber),                                        
                  // Chamando modelo de build, passando os parametros necessarios                
                TextFormField(
                  controller: nomeController,   // Controlador, passado por parametro, 
                  decoration: InputDecoration(
                    labelText: "Nome", // Placeholder sera passado por paramtro
                    labelStyle: TextStyle(color: Colors.black),      
                    border: OutlineInputBorder(), // Borda                  
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 20.0),                  
                  maxLength: 80,
                  keyboardType: TextInputType.text, // Tipo do teclado
                  validator: _validarNome,                  
                ),                
               /*new Row( 
                  children: <Widget>[ */
                    TextFormField(
                    controller: cpfController,   // Controlador, passado por parametro, 
                    decoration: InputDecoration(
                      labelText: "CPF", // Placeholder sera passado por paramtro
                      labelStyle: TextStyle(color: Colors.black),      
                      border: OutlineInputBorder(), // Borda                  
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 20.0),                  
                    maxLength: 11,
                    keyboardType: TextInputType.number, // Tipo do teclado
                    validator: _validarCpf,                  
                    ),
                  Divider(),
                    TextFormField(
                    controller: foneController,   // Controlador, passado por parametro, 
                    decoration: InputDecoration(
                      labelText: "Telefone", // Placeholder sera passado por paramtro
                      labelStyle: TextStyle(color: Colors.black),      
                      border: OutlineInputBorder(), // Borda                  
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 20.0),                  
                    maxLength: 11,
                    keyboardType: TextInputType.phone, // Tipo do teclado
                    validator: _validarCelular,                  
                    ),   
               /*   ],
                  ), */
                
                
                TextFormField(
                  controller: emailController,   // Controlador, passado por parametro, 
                  decoration: InputDecoration(
                    labelText: "Email", // Placeholder sera passado por paramtro
                    labelStyle: TextStyle(color: Colors.black),      
                    border: OutlineInputBorder(), // Borda                  
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 20.0),                  
                  maxLength: 50,
                  keyboardType: TextInputType.emailAddress, // Tipo do teclado
                  validator: _validarEmail,                  
                ),
                             
                const SizedBox(height: 30),
                  RaisedButton(
                    color: Colors.lightGreen,
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        print("Hello");
                        salvar();
                      }
                    },
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 20, color: Colors.white)
                    ),
                  ),                  
                ],
              ),
            ), 
           ),
          ), 
      );
    }
  }
  

   String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }
  String _validarCelular(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o celular";
    } else if(value.length != 11){
      return "O celular deve ter 11 dígitos";
    }else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }
  String _validarCpf(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o CPF";
    } else if(value.length != 11){
      return "O celular deve ter 11 dígitos";
    }else if (!regExp.hasMatch(value)) {
      return "O CPF deve conter apenas dígitos";
    }
    return null;
  }
  String _validarEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }else {
      return null;
    }
  }

 /*_sendForm() {
    if (_formKey.currentState.validate()) {
      // Sem erros na validação
      _formKey.currentState.save();
      print("Nome $nome");
      print("Ceclular $celular");
      print("Email $email");
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
*/

/*
Widget buildTextField(String label, TextEditingController controlador, int max, String validacao/*,  String prefix, Function funcao */){
  return TextFormField(
    controller: controlador,   // Controlador, passado por parametro, 
    decoration: InputDecoration(
      labelText: label, // Placeholder sera passado por paramtro
      labelStyle: TextStyle(color: Colors.black),      
      border: OutlineInputBorder(), // Borda
    //  prefixText: prefix     // Prefixo diferente nos campos, passado por parametro
    ),
    style: TextStyle(
      color: Colors.black, fontSize: 20.0
    ),
    //onChanged: funcao, // Função passado por parametro sera executado quando o valor for alterado        
    maxLength: max,
    keyboardType: TextInputType.number, // Tipo do teclado
    validator: validacao,
    /*validator: (value){ // Validando valor
                if(value.isEmpty){
                  return "Preencha os campos obrigatorios!";
                }                
              },*/
    // keyboardType: TextInputType.numberWithOptions(decimal: true), -> PARA DECIMAL EM IOS
  ); */
