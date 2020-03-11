import 'dart:io';
main(){
  // Se o user digitar 0 o programa finaliza.
  print("Digite 0 para parar.");
  String textCod = stdin.readLineSync();
  int cod = int.parse(textCod);
  int x = 1;    
  while(cod != 0){        
    print("======================$x");
    // Quando o contar está em 10 ou em 20,  o usuário pode para o programa novamente.
    if((x==10)||(x==20)){
      print("Digite 0 para parar.");
      String textCod = stdin.readLineSync();
      int cod = int.parse(textCod);
    }
    // Quando o contador chega a 150, o progama é finalizado.
    else if(x==150){
      cod = 0;
    }
    x++;
  }
}