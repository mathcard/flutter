import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

enum MyDialogActions {yes, no}

class _HomeState extends State<Home>{
  
  void _dialogResult(MyDialogActions value){
    print("Your select $value");
    Navigator.pop(context);
  }
    
  void _showAlert(){
    AlertDialog dialog = AlertDialog(
      content: Text(
        "Título",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0),
      ),
    actions: <Widget>[
      FlatButton(
        onPressed: (){ _dialogResult(MyDialogActions.yes);},
        child: Text("Yes"),
      ),  
      FlatButton(
        onPressed: (){ _dialogResult(MyDialogActions.no);},
        child: Text("No"),
      ),
    ],  
  );
  showDialog(context: context, child: dialog);
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            _showAlert();
          },
          child: Text(
            "AlertDialog",
            style: TextStyle(color: Colors.white, fontSize: 30.0),),
          color: Colors.black, 
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),

    );
  }
}