import 'dart:io';
main(){
  var nome = [];
  bool condicao = true;

  while(condicao){
    print("Digite o nome ou exit para sair");
    String text = stdin.readLineSync();
    if(text == "exit"){
      print("===== Fim Prog 01=====");
      condicao = false;
    }else{
      nome.add(text);
    }
    print(nome);
    print("\n");

  }


// Adicionando e Removendo itens do Array
  print("======  Add/Remove Item Array   =======");
 
  List<String> nomes = ["Samara", "Ana", "Carulina", "Bruna"]; // Declarando tipo de array List<String>
  nomes.add("Gisele"); // Adicionando itens no array
    
  print("Nomes: $nomes");
  print(nomes.length);

  // Removendo item do array
  nomes.remove("Bruna");
  nomes.removeAt(1);

  print("Nomes: $nomes");
  print(nomes.length);
  
}