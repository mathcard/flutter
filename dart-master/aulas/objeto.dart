class Pessoa{
  String nome;
  int _idade; // O underline indica que a variavel pode ser alterada apenas dentro da classe
  double _altura;

  // Declarando construtor 
  /*
  Pessoa(String nome, int idade, double altura){
    this.nome = nome;
    this.idade = idade;
    this.altura = altura;
  }
  */

  //Melhorando a declaração
  Pessoa(this.nome, this._idade, this._altura);

  Pessoa.nascer(this.nome, this._altura){
    _idade = 0;
    print("$nome nasceu!");
    dormir();
  }

  void dormir(){
    print("$nome está dormindo!");
  }

  void niver(){
    _idade++;
  }

  // Utilize get e set apenas onde for necessario
  // Criando getter para pegar a variavel _idade e _altura
  int get idade => _idade;
  
  double get altura => _altura;
    
  // Criando um setter para setar  a variavel _altura
  set altura(double altura){
    if(altura > 0.0 && altura < 2.5){
      _altura = altura;
    }
  }
  
}

void main(){
  //Pessoa = pessoa ->> Declarando Objeto 
  //Pessoa(); ->> Instanciar Objeto
  Pessoa pessoa1 = Pessoa("Matheus", 25, 1.70); 
  Pessoa nene = Pessoa.nascer("Matheuszito", 0.30);

  //print(pessoa1.idade);
  //pessoa1.niver();
  //print(pessoa1.idade);
  
  nene.altura = 1.70;
  print(nene.altura);
  print(nene.nome);
}