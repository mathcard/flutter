import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  FirebaseAuth auth = FirebaseAuth.instance;     
  String email = "matheus@gmail.com";
  String senha = "123456";

  auth.signInWithEmailAndPassword(
    email: email,
    password: senha
  ).then((firebaseUser){
    print("Usuario ${firebaseUser.email} logado com sucesso!");
  }).catchError((error){
    print("Erro: ${error.toString()}");
  });
  
  runApp(Home());
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

