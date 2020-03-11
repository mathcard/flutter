import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:date_format/date_format.dart';


//PAREI NA PAGINA 120
void main() => runApp(
    MaterialApp(
      home: Home(),
    )  
);

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  final _toDoController = TextEditingController();

List _toDoList = [];

Map<String, dynamic> _ultimaTarefaRemovida;
int _ultimaTarefaRemovidaPosicao;

@override
void initState(){
  super.initState();
  _readData().then((data){
    setState((){
      _toDoList = json.decode(data);
    });
  });  
}


  void _addToDo(){
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["titulo"] = _toDoController.text;
      _toDoController.text = "";
      newToDo["status"] = false;
      newToDo["inicio"] = formatDate(DateTime.now(), [dd, '/', mm, '/', yyyy]);
      _toDoList.add(newToDo);
      _saveData();
    });

  }
      
  //Obter dados
  Future<String> _readData() async{
    try{
      final file = await _getFile();
      return file.readAsString();
    }catch(e){
      return null;
    }
  }

  // Salvar os dados
  Future <File> _saveData() async{
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }
  
  // Ler o arquivo de dados
  Future<File> _getFile() async{
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/dados_tarefa.json");
  }  
  
  Widget buildItemCheckboxListTile(context, index){
    return CheckboxListTile(
      title: Text(_toDoList[index]["titulo"]),
      value: _toDoList[index]["status"],
      secondary: CircleAvatar(
        child: Icon(
          _toDoList[index]["status"] ?
          Icons.thumb_up : Icons.thumb_down
        ),
      ),
      onChanged: (value){
        setState(() {
          _toDoList[index]["status"] = value; 
          _saveData();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context){
    
    // Configurando a AppBar
    AppBar appBar = AppBar(
      title: Text("Lista de Tarefas"),
      backgroundColor: Colors.black26,
      centerTitle: false,
    );

    TextField textField = TextField(
      controller: _toDoController,
      decoration: InputDecoration(
        labelText: "Nova Tarefa",
        labelStyle: TextStyle(color: Colors.black)
      ),
    );

    RaisedButton btnAdd = RaisedButton(
      onPressed: _addToDo,
      color: Colors.black,
      child: Text("ADD"),
      textColor: Colors.white,
    );

    // Configurando a linha do input e button
    Row row = Row(
      children: <Widget>[
        Expanded(
          child: textField
        ),
        btnAdd
      ],
    );

    // Configurando o container do topo
    Container containerTop = Container(
      padding: EdgeInsets.fromLTRB(18.0, 1.0, 6.0, 1.0),
      child: row,
    );
/*
    // Configurando a lista de tarefas
    ListView listViewTarefas= ListView.builder(
      padding: EdgeInsets.only(top: 10.0),
      itemCount: _toDoList.length,
      itemBuilder: (context, index){
        return CheckboxListTile(
          title: Text(_toDoList[index]["titulo"]),
          value: _toDoList[index]["status"],
          secondary: CircleAvatar(
            child: Icon(
              _toDoList[index]["status"] ?
                Icons.thumb_up : Icons.thumb_down
            ),
          ),
          onChanged: (value){
            setState(() {
              _toDoList[index]["status"] = value; 
              _saveData();
            });
          },
        );
      },
    );

*/
    // Configurando a lista de tarefas
    ListView listViewTarefas= ListView.builder(
      padding: EdgeInsets.only(top: 10.0),
      itemCount: _toDoList.length,
      itemBuilder: (context, index){
        return Dismissible(
          key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
          background: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment(-0.9, 0.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
          direction: DismissDirection.startToEnd,     
          child: buildItemCheckboxListTile(context, index),     
          onDismissed: (direction){
            setState(() {
              _ultimaTarefaRemovida = Map.from(_toDoList[index]);
              _ultimaTarefaRemovidaPosicao = index;
              _toDoList.removeAt(index);
              _saveData();
              final snack = SnackBar(
                content: Text("Tarefa \"${_ultimaTarefaRemovida["titulo"]}\"removida."),
                action: SnackBarAction(
                  label: "Desfazer",
                  onPressed: (){
                    setState(() {
                      _toDoList.insert(_ultimaTarefaRemovidaPosicao, _ultimaTarefaRemovida);
                      _saveData();
                    });
                  },
                ),
              duration: Duration(seconds: 3),
              );
              Scaffold.of(context).showSnackBar(snack);
            });
          },          
        );
        //return dismissible; 
      },
    );

    // Configurando a colunas
    Column column = Column(
      children: <Widget>[
        containerTop,
        Expanded(
          child: listViewTarefas
          )
      ],

    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      body: column,
    );

    return scaffold;
    //return Container();
  }
}
