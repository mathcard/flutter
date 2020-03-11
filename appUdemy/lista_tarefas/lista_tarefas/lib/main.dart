import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _toDoController = TextEditingController();
  
  List _toDoList = [];
  
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;

  @override
  void initState() {
    // Buscando os dados salvos sempre que iniciar o app
    super.initState();
    _readData().then((data){
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  void _addToDo(){
   setState(() {
     Map<String, dynamic> newToDo = Map(); // Criando a variavel tipo map (linha de dados)
    newToDo["title"] = _toDoController.text; //Passando o valor do controlador para o título
    _toDoController.text = ""; // Limpando o valor do TextField
    newToDo["ok"] = false; // Colocando checkbox false
    _toDoList.add(newToDo); // Adicionando na lista 
    _saveData();
   });
  }

  // Ordenando a Lista
  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1)); // Espera 1 segundo
    setState(() {
      // Ordenação padrão do Dart -1, 0, 1 (Tarefas não realizadas primeiro)
      _toDoList.sort((a, b){ // a>b = 1; a<b=-1; a==b = 0;
        if(a["ok"] && !b["ok"]) return 1; 
        else if(!a["ok"] && b["ok"]) return -1;
        else return 0;
      });
      _saveData();
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas :("),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(child: TextField(
                  controller: _toDoController,
                  decoration: InputDecoration(
                    labelText: "Nova Tarefa",
                    labelStyle: TextStyle(color: Colors.lightBlue),
                  ),
                ),
              ),                
              RaisedButton(                
                color: Colors.lightBlue,
                child: Text("Add"),
                textColor: Colors.white,
                onPressed: _addToDo,
                ),
              ],
            ),             
          ),
          Expanded( // Especifica o tamanho da lista
            child: RefreshIndicator( // Recarregar a tela
              onRefresh: _refresh,
              child: ListView.builder( // Widget que permite construir um lista
              padding: EdgeInsets.only(top: 10.0),
              itemCount: _toDoList.length,
              itemBuilder: buildItem),
            ),
          ), 
        ],
      ),
    );
  }

// Widget que imprime a lista
  Widget buildItem(context, index){
  return Dismissible(
    key: Key(DateTime.now().millisecondsSinceEpoch.toString()), // Key deve ser um nome diferente
    background: Container(
      color: Colors.red,
      child: Align(
        alignment: Alignment(-0.9, 0.0), // Alinhando ao lado esquerdo
        child: Icon(Icons.delete, color: Colors.white,),
      ),
    ),
    direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"],
        secondary: CircleAvatar( // Circula azul 
          child: Icon(
            // Condição ? V : F
            _toDoList[index]["ok"] ? Icons.check : Icons.error),), 
        onChanged: (c) { // É necessario para poder marcar
          setState(() {
            _toDoList[index]["ok"] = c; // (c)hecked 
            _saveData();
          });
        },
      ),
      onDismissed: (direction){ // Ações diferentes dependendo da posição
        setState(() {
          _lastRemoved = Map.from(_toDoList[index]); 
          _lastRemovedPos = index; // Busca a posição do último item
          _toDoList.removeAt(index);
          _saveData(); // Salva a lista com item removido 
          final snack = SnackBar(
            content: Text("Tarefa \"${_lastRemoved["title"]}\" removida!"),
            action: SnackBarAction(label: "Desfazer",
                onPressed: (){
                  setState(() {
                    _toDoList.insert(_lastRemovedPos, _lastRemoved);
                    _saveData(); 
                  });
                }),
                duration: Duration(seconds: 2),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack); // Mostra o snackbar
        });

      },     
    ); 
  }

    // Chama o arquivo para salvar
  Future<File> _getFile() async{
    final directory = await getApplicationDocumentsDirectory(); // Local onde são gravados os arquivos
    return File("${directory.path}/data.json");
  }

  // Salva os dados
  Future<File> _saveData() async{
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  // Lendo os dados
  Future<String> _readData() async{
    try{
      final file = await _getFile();
      return file.readAsString();
    }catch(e){
      return null;
    }
  }

}