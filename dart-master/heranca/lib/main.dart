import 'package:heranca/onca.dart';
import 'package:heranca/src/cachorro.dart';
import 'package:heranca/src/gato.dart';
import 'package:heranca/src/sapo.dart';

main(List<String> arguments) {
  Gato gato = Gato(nome: "Garfield", barrulho: "Mêauu");
  Cachorro cachorro = Cachorro(nome:"Scoby-Doo", barrulho: "Scoby-by-do-by-do");
  Sapo sapo = Sapo(barrulho: 'Weberth');
  Onca onca = Onca(barrulho: 'Raw ua raw ua Raw');
  print("O gato ${gato.nome} faz: ${gato.barrulho}");
  print("O cachorro ${cachorro.nome} faz: ${cachorro.barrulho}");
  print("O sapo faz ${sapo.barrulho}");
  print("A onça faz ${onca.barrulho}");
}