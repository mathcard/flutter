// CRIANDO USUÁRIOS
void main() async {
  FirebaseAuth auth = FirebaseAuth.instance;      

  //Criando usuário com e-mail e senha.
  String email = "math@gmail.com";
  String senha = "123456";

  auth.createUserWithEmailAndPassword(
    email: email,
    password: senha
  ).then((firebaseUser){
    print("Usuário criado com sucesso: ${firebaseUser.email}");
  }).catchError((error){
    print("Erro: ${error.toString()}");
  });

   runApp(Home());
}


// VERIFICAR USUÁRIOS ONLINE
void main() async {
  FirebaseAuth auth = FirebaseAuth.instance;     
  FirebaseUser user = await auth.currentUser(); 

  if(user != null){
    print("O usuário ${user.email} está logado!");
  }else{
    print("Não existem usuários logados.");
  }
   runApp(Home());
}

//LOGOUT
void main() async {
  FirebaseAuth auth = FirebaseAuth.instance;     
  FirebaseUser user = await auth.currentUser(); 
  auth.signOut();
  if(user != null){
    print("O usuário ${user.email} está logado!");
  }else{
    print("Não existem usuários logados.");
  }
   runApp(Home());
}

// INSERT
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
