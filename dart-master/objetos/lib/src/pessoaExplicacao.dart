class Pessoa{
  // Variaveis são globais dentro da clase criada.
  String nome;
  int idade;
  String sexo;

  // Metodo
  //Pessoa(String nome, int idade, String sexo){ # Desta forma os dados devem ser passados na ordem; 
  
  /*
  Pessoa({String nome, int idade, String sexo}){ # Desta forma os dados são passados de forma independente;
    this.nome = nome; 
    this.idade = idade;
    this.sexo = sexo;
  } 
  
  */

  String _nomeLocal = "Blade"; // Variavel privada _antesDoNome
  final String otherNome = "Slender"; // Final não permite estanciar a variavel novamente;

  
  // CONSTRUTORES INTELIGENTES - No dart o this pode ser chamado na declaração da função;
  Pessoa({this.nome, this.idade, this.sexo}); // this reforça que pode pegar a variavel de forma global;

}