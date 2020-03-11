import 'dart:io';
// Modularizar é reaproveitar código
// List<String> produtos =[]; FORA DA CLASSE PRINCIPAL A VARIRALVE É GLOBAL
main(){ 
  List<String> produtos =[];
  bool condicao = true;

  while(condicao){    
    print("======== Lista de Compras =========");
    print("Digite ok para inserir, ou digite remover para remover ou sair para sair hehehhehe");
    String text = stdin.readLineSync();        
    if(text=='sair'){
      imprimir(produtos);      
      print("=== FIM ===");
      condicao = false;
    }else if(text=='remover'){
      imprimir(produtos);
      remover(produtos);      
    }else{
      print("Digite o nome do produto?");
      String prodAdd = stdin.readLineSync();
      produtos.add(prodAdd);
      print("=== ITEM ADD ===");
      imprimir(produtos);
      //print("\x1B[2J\x1B[0;0H"); fazer limpeza do TERMINAL, mas não funcionou
    }    
  } 
}

// Dedici fazer as funções passando a variável como parâmetro
// Podeira colocar List produtos como variável global, basta colocar fora da classe main();
remover(List produtos){
  print("Qual item remover?");
  int item = int.parse(stdin.readLineSync());      
  produtos.removeAt(item);
  print("=== ITEM REMOVIDO ===");      
}

void imprimir(List produtos){
  for(var i = 0; i<produtos.length; i++){    
    print("ITEM: $i - ${produtos[i]}");    
  }
}