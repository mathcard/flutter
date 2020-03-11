// Classe Pai
class Animal{
  String nome;
  double peso;
  
   // Precisa declarar o construtor para utilizar na classe filho
  Animal(this.nome, this.peso);

  void comer(){
    print("$nome comeu!");
  }

  void fazerSom(){
    print("$nome fez algum som!");
  }
  
}

// Classe filha herda classe pai
class Cachorro extends Animal{
  int fofura;
  
  void brincar(){
    fofura++;
  }
  
  // : super(nome, peso) informa que os atributos são herdados da classe pai
  Cachorro(String nome, double peso, this.fofura) : super(nome, peso);
  
  // Reescrita de metodo
  @override
   void fazerSom(){
    print("$nome fez RalfRAlfRALF!");
  }
  
  // Metodo toString existe por padrão, com ele é possivel dar print no objeto. Ex na penultima linha do main
  @override
  String toString(){
    return "Cachorro | Nome: $nome, Peso: $peso, Forura: $fofura";
  }
  
}

class Gato extends Animal{
  Gato(String nome, double peso) : super(nome, peso);

  bool estaAmigavel(){
    return false;
  }
  
  // Reescrita de metodo
  @override
   void fazerSom(){
    print("$nome fez MÊAU MÊAU!");
  }
  
}

void main() {
  Cachorro cachorro = Cachorro("Timão", 35, 1);
  cachorro.fazerSom();
  cachorro.comer();
  cachorro.brincar();
  print("Nome: ${cachorro.nome}, Peso:${cachorro.peso}, Nível de Fofura:${cachorro.fofura};");
  Gato gato = Gato ("Ton", 2);
  gato.fazerSom();
  print(cachorro);
}