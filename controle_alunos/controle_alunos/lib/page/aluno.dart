import 'dart:io';
import 'package:controle_alunos/model/aluno.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AlunoPage extends StatefulWidget {
  //@override
  
  final Aluno aluno;
  AlunoPage({this.aluno});

  _AlunoPageState createState() => _AlunoPageState();

}

class _AlunoPageState extends State<AlunoPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _instituicaoController = TextEditingController();
  
  final _nameFocus = FocusNode();
  bool _alunoEdited = false;
  Aluno _alunoTemp;

  Widget buildAppBar(){
    return AppBar(
      title: Text(_alunoTemp.nome ?? "Novo Aluno"),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }

  // Botão com icone de salvar
  Widget buildFloatingActionBuutton(){
    return FloatingActionButton(
      child: Icon(Icons.save),
      backgroundColor: Colors.black,
      onPressed: (){
        if(_alunoTemp.nome != null && _alunoTemp.nome.isNotEmpty){
          Navigator.pop(context, _alunoTemp);
        }else{
          FocusScope.of(context).requestFocus(_nameFocus);
        }
      },
    );
  }

  Widget buildContainerImagem(){
    return GestureDetector(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: _alunoTemp.pathImg != null ?
              FileImage(File(_alunoTemp.pathImg)):
              AssetImage("images/student.png")
          ),
        ),
      ),
      onTap: (){ // Alterando foto usando a camera
        ImagePicker.pickImage(
          source: ImageSource.camera).then((file){
            if(file==null){
              return;
            }else{
              setState(() {
                _alunoTemp.pathImg = file.path;
              });
            }
        });        
      },
    );
  }

  Future<bool> _requestPop(){
    if(_alunoEdited){
      showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Descartar Alterações?"),
          content: Text("Se continar as alterações serão perdidas"),
          actions: <Widget>[
            FlatButton(child: Text("Cancelar"),
              onPressed: (){Navigator.pop(context);},
            ),
            FlatButton(child: Text("Continuar"),
              onPressed: (){Navigator.pop(context); Navigator.pop(context);},
            ),
          ],
        );
      });
      return Future.value(false);
    }else{
      return Future.value(true);
    }
  }

  // Depois mudar return WillPopScope e criar a funçã _requestPop
  // Os dados foram inseridos
  Widget buildScaffold(){
    return WillPopScope(
      onWillPop: _requestPop, 
      child: Scaffold(
        appBar: buildAppBar(),
        floatingActionButton: buildFloatingActionBuutton(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              buildContainerImagem(),
              TextField(
                decoration: InputDecoration(labelText: "Nome",),
                // Quando o nome digitado, alterar o título da AppBar
                onChanged: (text){
                  _alunoEdited = true;
                  setState(() { // Atualiza o estado da aplicação
                  _alunoTemp.nome = text; 
                  });
                },
                controller: _nameController,
                focusNode: _nameFocus,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Email",),
                keyboardType: TextInputType.emailAddress,
                onChanged: (text){
                  _alunoEdited = true;
                  _alunoTemp.email = text;
                },
                controller: _emailController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Telefone",),
                keyboardType: TextInputType.phone,
                onChanged: (text){
                  _alunoEdited = true;
                  _alunoTemp.telefone = text;
                },
                controller: _telefoneController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Instituição",),
                onChanged: (text){
                  _alunoEdited = true;
                  _alunoTemp.instituicao = text;
                },
                controller: _instituicaoController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }

  @override 
  void initState(){
    super.initState();
    if(widget.aluno == null){
      _alunoTemp = Aluno();
    }else{
      _alunoTemp = Aluno.fromMap(widget.aluno.toMap());

      _nameController.text = _alunoTemp.nome;
      _emailController.text = _alunoTemp.email;
      _telefoneController.text = _alunoTemp.telefone;
      _instituicaoController.text = _alunoTemp.instituicao;
    }
  }

}