import 'dart:io'; //input

main() {
  var hello = "Hello World";
  var total = "Hello" + " World";
  print(hello);
  print(total);

//input
print("============ Digite sua idade =============");
  var input = stdin.readLineSync();
  var idade = int.parse(input);
  

  if(idade>=50){
    print("melhor idade");
  }else if(idade >=18){
    print("maior de idade");
  }else if(idade >=12){
    print("adolecente");
  }else{
    print("criança");
  }
  
}