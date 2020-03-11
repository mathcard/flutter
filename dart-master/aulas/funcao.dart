void main(){
  criarBotao("BotaoSair", botaoCriado); //Chamando funçao e passando 2 argumentos, o texto e a funçao
  criarBotao("texto", (){
    print("Botão criado por função anonma");
  });
}

// Funcao que será passado no main
void botaoCriado(){
  print("Botao Criado!!!");
}

// Função que recebe texto, uma nova função, cor e largura são opcionais {}
void criarBotao(String texto, Function criadoFunc, {String cor, double largura}){
  print(texto);
  print(cor ?? "Preto");
  print(largura ?? 10.0);
  criadoFunc();
}