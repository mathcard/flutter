import "package:flutter/material.dart";
import 'package:flutter/material.dart' as prefix0;

//Entry Point
void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    title: 'Médias',
    home: media()

  )); // MaterialApp() - DESIGN
}

class media extends StatelessWidget{
  
  //TextEditingController controllerNotaA = TextEditingController();
  //TextEditingController controllerNotaB = TextEditingController();

  //GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //declarando variaves
  String nome;
  double notaA = 0.0;
  double notaB = 0.0;
  double notaC = 0.0;

  get conceito => null;  
  
  @override
  Widget build(BuildContext context) {
  // TODO: implement build
  
  
  /* Exemplos de icones e texto simples
  Icon icone = Icon(
    Icons.image,
    size: 64.0,    
  );

  Text texto = Text(
    'Text Example with icon ->',
    style: TextStyle(
      color: Colors.red,
      fontSize: 32.0,
      
      ),
  );
    */ 
  // Entrada de dados
  TextField tfNotaA = TextField(
    decoration: InputDecoration(labelText: 'Informe a primeira nota.' ),
    keyboardType: TextInputType.number,
    onChanged: (value){
      try{
        notaA = double.parse(value);
      } catch(ex){
          notaA = 0.0;
      }
    },
  );

  TextField tfNotaB = TextField(
    decoration: InputDecoration(labelText: 'Informe a segunda nota.' ),
    keyboardType: TextInputType.number,
    onChanged: (value){
      try{
        notaB = double.parse(value);
      } catch(ex){
          notaB = 0.0;
      }
    },
  );
  
  TextField tfNotaC = TextField(
    decoration: InputDecoration(labelText: 'Informe a terceira nota.' ),
    keyboardType: TextInputType.number,
    onChanged: (value){
      try{
        notaC = double.parse(value);
      } catch(ex){
          notaC = 0.0;
      }
    },
  );
 
  RaisedButton btnCalcular = RaisedButton(
    child: Text('Calcular'),
    onPressed: (){
    double media = (notaA + notaB + notaC)/3;
  
      String  nota;
      String conceito;
      if(media > 9){
        nota = "A";
      }
      if((media > 7.5)&&(media <= 9)){
        nota = "B";
      }
      if((media > 6)&&(media <= 7.5)){
        nota = "C";
      }
      if((media > 4)&&(media <= 6)){
        nota = "D";
      }
      if((media > 0)&&(media <= 4)){
        nota = "E";
      }

      if((nota=="D")||(nota =="E")){
        conceito = 'Reprovado';
      }else{
        conceito = 'Aprovado';
      }  

      AlertDialog resultDialog = AlertDialog(
        content: Text('Sua nota foi $media, você tirou $nota e foi $conceito.'),
      );
      showDialog(context: context, child: resultDialog);   
  
    },
    
  );

  Container container = Container(
    padding: EdgeInsets.all(10.0),
    child: Column(children: <Widget>[
      /*texto, icone,*/ tfNotaA, tfNotaB, tfNotaC, btnCalcular  
    ],),
  );
  
  // Barra de título
  AppBar appBar = AppBar(
    title: Text('Médias'),

  );
  
  // Widget resp organização dos widgets
  Scaffold scaffold = Scaffold(
    appBar: appBar,
    body: container,
  ); // Widget resp. pela org

    return scaffold;
  }  
}
