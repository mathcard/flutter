
// INSERT
void main() async {
   Firestore db = Firestore.instance;
   db.collection("usuarios")
    .document("COD-001")
  .setData({"nome": "Matheus", "idade": "99"});     
   runApp(Home());
}

// INSERT 2
void main() async {
  Firestore db = Firestore.instance;
  DocumentReference ref = await db.collection("usuarios")  
  .add({"nome":"Deia", "idade":"27"});

  print("código: " + ref.documentID);
   runApp(Home());
}

// UPDATE
void main() async {
  Firestore db = Firestore.instance;
  db.collection("usuarios")  
    .document("f452ZZ0Sk1bm3SXJ8Qak")
    .setData({"nome":"ATUALIZANDO NOME: Andreia", "idade": "27"});  
   runApp(Home());
}

// DELETE
void main() async {
  Firestore db = Firestore.instance;
  db.collection("usuarios")  
    .document("bysN7nYZ6uKGBZNfKSpk")
    .delete();  
   runApp(Home());
}

// SELECT BY YD
void main() async {
  Firestore db = Firestore.instance;
  DocumentSnapshot snapshot = await db.collection("usuarios")
    .document("AqaakQlR3iYxIkNeraVv").get();
    var user = snapshot.data;
    print("Usuáro [nome: "+ user["nome"] + ", idade:" + user["idade"]+"]");
   runApp(Home());
}

// SELECT ALL
void main() async {
  Firestore db = Firestore.instance;
  QuerySnapshot querySnapshot = await db.collection("usuarios")
    .getDocuments();
    
    for(DocumentSnapshot s in querySnapshot.documents){
      var user = s.data;
      print("Usuáro [nome: "+ user["nome"] + ", idade:" + user["idade"]+"]");
    }     
   runApp(Home());
}

//NOTIFICAÇÕES

void main() async {
  Firestore db = Firestore.instance;
  db.collection("usuarios")
    .snapshots()
    .listen((snapshots){
      for(DocumentSnapshot s in snapshots.documents){
        var user = s.data;
        print("Usuáro [nome: "+ user["nome"] + ", idade:" + user["idade"]+"]");
      }     
    });        
   runApp(Home());
}

// WHERE
void main() async {
  Firestore db = Firestore.instance;
  QuerySnapshot querySnapshot = await db.collection("usuarios")
    //.where("nome", isEqualTo: "Matheus")
    .where("idade", isEqualTo: "25")
    .getDocuments();    
      for(DocumentSnapshot s in querySnapshot.documents){
        var user = s.data;
        print("Usuáro ${user["nome"]} - ${user["idade"]}");
      }     
    
   runApp(Home());
}
