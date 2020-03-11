import 'dart:io';

import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactPage extends StatefulWidget {
  final Contact contact; // Declara o contato
  ContactPage({this.contact}); // Cria construtor que recebe o contato
  
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // Controladores - Permite usar os valores das variaves
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;
  
  Contact _editedContact; // Contato editado
  
  @override
  void initState(){
    super.initState();
    // Widget - acessando arquivos de classe diferente
    if(widget.contact == null){
      _editedContact = Contact();  //Criando contato
    }else{ // Transformando contato passado em map e criando novo contato
      _editedContact = Contact.fromMap(widget.contact.toMap());
      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;

    }
  }
  

  
  @override
  Widget build(BuildContext context) {
    return WillPopScope( //Executa funçao antes de sair da tela
      onWillPop: () { _requestPop();},
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_editedContact.name != null && _editedContact.name.isNotEmpty ){
            Navigator.pop(context, _editedContact); // Volta pra tela anterior com contato salvo
          }else{
            FocusScope.of(context).requestFocus(_nameFocus); // Não salva e foca no nome
          }
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: _editedContact.img != null ? 
                      FileImage(File(_editedContact.img)) :
                        AssetImage("images/person.png"),
                        fit: BoxFit.cover, // Imagem circular
                      ),
                ),
              ),
              onTap: (){ // Utilizando a camera para tirar a foto
                ImagePicker.pickImage(source: ImageSource.camera).then((file){
                  if(file == null) return;
                  setState(() {
                    _editedContact.img = file.path;
                  });
                });
              },
            ),
            TextField(
              controller: _nameController,
              focusNode: _nameFocus,
              decoration:  InputDecoration(labelText: "Nome"),
              onChanged: (text){
                _userEdited = true;
                setState(() {
                  _editedContact.name = text;
                });
              },              
            ),
            TextField(
              controller: _emailController,
              decoration:  InputDecoration(labelText: "Email"),
              onChanged: (text){
                _userEdited = true;                
                _editedContact.email = text;                
              },              
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _phoneController,
              decoration:  InputDecoration(labelText: "Phone"),
              onChanged: (text){
                _userEdited = true;                
                _editedContact.phone = text;                
              },  
              keyboardType: TextInputType.phone,            
            ),
          ],
        ),
      ),
      ), 
    );
  }



  Future<bool> _requestPop(){
    if(_userEdited){
      showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Descartar alterações?"),
            content: Text("Se sair as alterações serão perdidas."),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: (){
                  Navigator.pop(context); // Sai do dialogo
                },
              ),
              FlatButton(
                child: Text("Sim"),
                onPressed: (){ // Sai do dialogo e sai da pagina
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
      );
      return Future.value(false); // Não sai automaticamente
    }else{
      return Future.value(true); //Sai automaticamente da tela
    }
  }
}