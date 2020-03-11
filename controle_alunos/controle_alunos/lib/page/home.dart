import 'dart:io';
import 'package:controle_alunos/helper/aluno_helper.dart';
import 'package:controle_alunos/model/aluno.dart';
import 'package:controle_alunos/page/aluno.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  AlunoHelper helper = AlunoHelper();
  List<Aluno> lsAlunos = List();

  // Função que redireciona para outra pagina
  void _showAlunoPage({Aluno aluno}) async {
    final regAluno = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlunoPage(aluno: aluno)
      ),
    );     

    if(regAluno != null){
      if(aluno != null){
        await helper.update(regAluno);
      }else{
        await helper.insert(regAluno);
      }
      _loadAllAlunos();
    }
  }

  void _loadAllAlunos(){
    helper.selectAll().then((list){
      setState(() {
        lsAlunos = list;
      });
    });
  }    

  @override
  void initState(){
    super.initState();
    _loadAllAlunos();
  }

  Widget buildAppBar(){
    return AppBar(
      title: Text("Alunos"),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }

  Widget buildFloatingActionButotn(){
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.black,
      onPressed: (){
        _showAlunoPage();
      },
    );
  }

  Widget buildCardAluno(BuildContext context, int index){
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(                  
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: lsAlunos[index].pathImg != null ?
                    FileImage(File(lsAlunos[index].pathImg)):
                    AssetImage("images/student.png"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(lsAlunos[index].nome ?? "-",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),                    
                    ),
                    Text(lsAlunos[index].email ?? "-",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),                    
                    ),
                    Text(lsAlunos[index].telefone ?? "-",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),                    
                    ),
                    Text(lsAlunos[index].instituicao ?? "-",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),                    
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        // Função que redireciona para outra pagina, agora busca os dados do aluno selecionado
        //_showAlunoPage(aluno: lsAlunos[index]);
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index){
    showModalBottomSheet(
      context: context,
      builder: (context){
        return BottomSheet(
          onClosing: (){},
          builder: (context){
            return Container(
              color: Colors.black,
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      "Ligar",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),),
                    onPressed: (){
                      launch("tel:${lsAlunos[index].telefone}");
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("E-mail", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                    onPressed: (){
                      launch("mailto:${lsAlunos[index].email}");
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("SMS", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                    onPressed: (){
                      launch("sms:${lsAlunos[index].telefone}");
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child:  FlatButton(
                      child: Text("Editar", 
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                        _showAlunoPage(aluno: lsAlunos[index]);
                      },
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "Excluir",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    onPressed: (){
                      helper.delete(lsAlunos[index].id);
                      setState(() {
                        lsAlunos.removeAt(index);
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    );
  }

  Widget buildListView(){
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: lsAlunos.length,
      itemBuilder: (context, index){
        return buildCardAluno(context, index);
      });
  }
    Widget teste(){
    AssetImage empresaAsset = AssetImage("images/student.png");
    Image image = Image(
      image: empresaAsset,
      width: 100.00,
      height: 100.0,
    );
    return Container(
      child: image,
      padding: EdgeInsets.only(top: 5.0),
    );
  }

  Widget buildScaffold(){
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      floatingActionButton: buildFloatingActionButotn(),
      body: buildListView(),
   //   body: teste(),
    );
  }

  @override
  Widget build(BuildContext context){
    return buildScaffold();
  }
}