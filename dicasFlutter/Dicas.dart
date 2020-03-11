// TIPOS DE DECLARAÇÃO DE FUNÇÕES
####Basicas
void main() {
  showMessage();
}

void showMessage(){
  print("Seja bem vindo as funções!");
}

########################################

void main() {
  String nome = 'Matheus do Carmo';
  int idade = 25;
  showMessage(nome, idade);
  showMessage(idade, nome);
}

void showMessage(nome, idade){
  print("Seja bem vindo as funções! $nome com $idade;");
}

/*CONSOLE:

Seja bem vindo as funções! Matheus do Carmo com 25;
Seja bem vindo as funções! 25 com Matheus do Carmo;
*/
############################################ 
//Função com Retorno

void main() {
  int numero = 10;
  int resultado = 0;
  
  resultado = calcularDobro(numero);
  print ("O dobro de $numero é $resultado.");  
}

int calcularDobro(int numero){
  return numero * numero;
}
#######################################
//Função Opcional - Retorno
void main() {
  int numero = 10;
  int resultado = 0;
  
  resultado = calcular(numero, 2);
  print ("Resultado: $resultado.");
  //showMessage(idade, nome);
}

int calcular(int numero, [int x]){
	// Se x for nulo, x = numero
  return numero * (x == null ? numero: x);
}
#######################################
//Nova Função
void main() {
  int numero = 10;
  int resultado = 0;

// Valor passado ao chamar a função sobressair  
  resultado = calcular(numero, 2);
  print ("Resultado: $resultado.");

  resultado = calcular(numero);
  print ("Resultado: $resultado.");
}

int calcular(int numero, [int x = 0]){
  return numero * x;
}

/*CONSOLE: 

Resultado: 20.
Resultado: 0. */
#####################################
//Parâmetros nomeados

void main() {
  double a = 10.0;
  double b = 3.0;
  double r = 0.0;
  
  r = calcularQuociente(a,b);
  print("Resultado '$r'!");
}

double calcularQuociente(double numerador, double divisor){
  return numerador / divisor;
}
####################################
//Parâmetros nomeados =>
void main() {
  double a = 10.0;
  double b = 3.0;
  double r = 0.0;
  
  r = calcularQuociente(numerador: a, divisor: b);
  print("Resultado '$r'!");
}

double calcularQuociente({double numerador, double divisor}) => numerador / divisor;

######################################
// Parâmetros nomeados 2
void main() {
  double a = 10.0;
  double b = 3.0;
  double r = 0.0;
  
  r = calcularQuociente(numerador: a, divisor: b);
  showResultado(quociente: r);
}

double calcularQuociente({double numerador, double divisor}) => numerador / divisor;

void showResultado ({double quociente}) => print("Resultado: '$quociente!''");
########################################
parei na pagina 33