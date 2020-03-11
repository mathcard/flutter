import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// pg 98

void main() async {
  Firestore db = Firestore.instance;
  QuerySnapshot querySnapshot = await db.collection("usuarios")    
    .where("idade", isGreaterThan: 20)
    .where("idade", isLessThanOrEqualTo: 30)
    //.orderBy("idade", descending:true)
    //.orderBy("nome", descending:false)
    .getDocuments();    
      for(DocumentSnapshot item in querySnapshot.documents){
        var user = item.data;
        print("Usuáro ${user["nome"]} - ${user["idade"]}");
      }     
    
   runApp(Home());
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

