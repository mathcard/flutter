import 'dart:io';

main(){
  calculoImc();
}

// Programa que calcula o imc
calculoImc(){
  print("Qual é o seu peso.");
  String textPeso = stdin.readLineSync();
  int peso = int.parse(textPeso);

  print("Qual é a sua altura");
  String textAltura = stdin.readLineSync();
  double altura = double.parse(textAltura);

  double imc = calcImcExpr(peso, altura);
  print(imc);
  imprimirResultado(imc);     
}

// Função que recebe o peso e altura e retorna o imc
double calcImcExpr(int peso, double altura){
  return peso / (altura * altura);
}

// Imprime o resultado baseado no imc
imprimirResultado(double imc){
  print("=================================");
   if(imc < 18.5){
    print("Abaixo do peso.");
  }else if(imc < 24.9){
    print("Peso Normal.");
  }else if(imc < 29.9){
    print("Sobrepeso.");
  }else if(imc < 34.9){
    print("Obesidade Grau 1");
  }else if(imc < 39.9){
    print("Obesidade Grau 2");
  }else { 
    print("Obesidade Grau 3");
  }
}