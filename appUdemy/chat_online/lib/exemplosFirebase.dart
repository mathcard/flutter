import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();   // Quando chamar alguma coisa antes do runApp();
    
  //Criando coleção dentro do document
  //Firestore.instance.collection("mensagens").document().collection("arqmidia").document().setData({"from":"Pelé", "texto":"Melhor agora, entende?"}); 
  //Firestore.instance.collection("usuarios").document("Pele").setData({"nome":"Edson A. Nascimento"});
  
  //INSERT
  Firestore.instance.collection("mensagens").document().setData({"from":"Xuxa", "texto":"Entendi, que bom!"});
  Firestore.instance.collection("usuarios").document("Pele").setData({"nome":"Edson A. Nascimento", "cidade":"Santos"});
    
  
// SELECT 
  DocumentSnapshot snapshot2 =  await Firestore.instance.collection("usuarios").document("Xuxa").get();
  print(snapshot2.data); 
  
// SELECT ALL
  QuerySnapshot snapshot = await Firestore.instance.collection("usuarios").getDocuments();
  for(DocumentSnapshot doc in snapshot.documents){
    print(doc.documentID);
    print(doc.data);
  }


  //  Com LISTEN, traz os dados atualizados em real time
  Firestore.instance.collection("mensagens").snapshots().listen((snapshot){
    for(DocumentSnapshot doc in snapshot.documents){
      print(doc.data);
    }
  });
  



  runApp(MyApp());
} 


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}