// arguments = Dados passados no terminal: Ex: dart main.dart matheus "juntando palavras"
import 'package:estudo/src/calculo_imc.dart';
import 'package:estudo/src/carrinho_compras.dart';
import 'package:estudo/src/idade.dart';
import 'src/cadastro.dart';

main(List<String> arguments) {
  if(arguments[0]== "idade"){
    calculoIdade();
  }else if(arguments[0] == "compras"){
    compras();
  }else if(arguments[0] == "imc"){
    calculoImc();
  }else if(arguments[0] == "cadastro"){
    cadastro();
  }else{ 
    print("COMAND NOT FOUND");
  }
}
