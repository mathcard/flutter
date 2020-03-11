class Pessoa{
  String nome;
  int idade;
  double altura;
  double peso;  

  // calcular imc com arrow function
  double imc() => peso / (altura * altura);    

  // se é maior de idade com arrow function
  bool maiorDeIdade() => idade >= 18; 
 
  /* 
  double imc(){
    return peso / (altura * altura);    
  } */

 
  
  /*bool maiorDeIdade(){
    return idade >= 18;
  }*/

}