import 'package:objetos/src/humano.dart';

// extends quer dizer que a classe Pessoa herda os dados da classe Humano
class Pessoa extends Humano{
  // Variaveis são globais dentro da clase criada.
  String nome;
  int idade;
  String sexo;

  Pessoa({this.nome, this.idade, this.sexo, peso, altura}) : super(peso: peso, altura: altura);
  // peso e altura estão na classe humano;

}