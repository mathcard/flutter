import 'package:objetos/src/pessoa.dart';

main(List<String> arguments) {
  
  //Objeto pessoa, do tipo Pessoa recebe a classe Pessoa();
  Pessoa pessoa = Pessoa(nome: "Matheus", idade: 25, sexo: "M", peso: 78, altura: 1.70);
  //pessoa.peso = 78;
  //pessoa.altura = 1.70;

  print(pessoa.nome);
  print(pessoa.idade);
  print(pessoa.sexo);
  
  print(pessoa.peso);
  print(pessoa.altura);


}
