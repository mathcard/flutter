import 'dart:convert';
import 'dart:io';

// 1º Valor = Key; 2º dynamic
  /*Map <String, dynamic> maps = {
    "nome" : "Matheus do Carmo",
    "idade" : 25,
    "cidade" : "Goiania",
    "estado" : "GO",
  };
  maps["nome"] = "Tuca LuZa";
  print(maps["nome"]); */


List<Map<String, dynamic>> cadastros = [];

main(){  
  bool condicao = true;
  while(condicao){
  print("=== Digite add para adicionar, exit para sair");
  String comando = stdin.readLineSync();
    if(comando == "exit"){
      condicao = false;
    }else if(comando == "add"){
      cadastar();
      print(cadastros);
    }else{
      print("=== Comando invalido ===");
    }
  }
  print(cadastros);
  
}

cadastar(){
  Map <String, dynamic> cadastro = {};
  print("--- Digite seu nome");
  cadastro["nome"] = stdin.readLineSync();

  print("--- Digite sua idade");  
  cadastro["idade"] = stdin.readLineSync();

  print("--- Digite sua cidade");  
  cadastro["cidade"] = stdin.readLineSync();
  cadastros.add(cadastro);
}