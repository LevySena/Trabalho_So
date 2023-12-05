//faça um codigo que leia inteiros separados por espaço e imprima a soma deles
//exemplo: 1 2 3 4 5 6 7 8 9 10
//saida: 55
// ignore_for_file: prefer_const_constructors

import 'dart:io';

void main() {
  print("Digite os numeros separados por espaço");
  String entrada = stdin.readLineSync()!;
  List<String> numeros = entrada.split(" ");
  int soma = 0;
  for (int i = 0; i < numeros.length; i++) {
    soma += int.parse(numeros[i]);
  }
  print(soma);
}
