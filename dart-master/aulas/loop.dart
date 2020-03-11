main() {
  //Loop with for
  for(int x=0; x<10; x++){
    print("Rodou: $x");    
  }
  print("==========");
  
  //Loop with while
  bool condicao = true;
  int y = 0;

  while(condicao){
    print("Rodou $y");
    if(y > 9){
      condicao = false;
    }
    y++;
  }
}