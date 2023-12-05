// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:so_trab/main.dart';

List<String> FIFO(List<String> ListaPaginas, int pagN) {
  List<String> memoria = [];
  int hit = 0;
  int miss = 0;
  for (int i = 0; i < ListaPaginas.length; i++) {
    if (memoria.length < pagN) {
      memoria.add(ListaPaginas[i]);
      miss++;
    } else {
      if (memoria.contains(ListaPaginas[i])) {
        hit++;
      } else {
        memoria.removeAt(0);
        memoria.add(ListaPaginas[i]);
        miss++;
      }
    }
  }
  return [hit.toString(), miss.toString()];
}

List<String> LRU(List<String> ListaPaginas, int pagN) {
  List<String> memoria = [];
  List<String> lastUsed = [];
  int hit = 0;
  int miss = 0;
  for (int i = 0; i < ListaPaginas.length; i++) {
    if (memoria.length < pagN) {
      memoria.add(ListaPaginas[i]);
      lastUsed.add(ListaPaginas[i]);
      miss++;
    } else {
      if (memoria.contains(ListaPaginas[i])) {
        hit++;
        lastUsed.remove(ListaPaginas[i]);
        lastUsed.add(ListaPaginas[i]);
      } else {
        memoria.remove(lastUsed[0]);
        lastUsed.removeAt(0);
        memoria.add(ListaPaginas[i]);
        lastUsed.add(ListaPaginas[i]);
        miss++;
      }
    }
  }
  return [hit.toString(), miss.toString()];
}

class homeState extends State<home> {
  String paginas = "";
  String paginasMemoria = "";
  List<String> FIFOresult = ["0", "0"];
  List<String> LRUresult = ["0", "0"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Trabalho SO",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Memoria virtual - paginas",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Container(
            height: 100,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (text) {
                      paginas = text;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sequência de paginas',
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (text) {
                      paginasMemoria = text;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Número de paginas na memória principal',
                    ),
                  ),
                  Container(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            List<String> paginasList = paginas.split(" ");
                            int pagN = int.parse(paginasMemoria.split(" ")[0]);
                            FIFOresult = FIFO(paginasList, pagN);
                          });
                        },
                        child: Text("FIFO"),
                        color: Colors.blue,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            List<String> paginasList = paginas.split(" ");
                            int pagN = int.parse(paginasMemoria.split(" ")[0]);
                            LRUresult = LRU(paginasList, pagN);
                          });
                        },
                        child: Text("LRU"),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Container(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          "FIFO: ${FIFOresult[0]} hits e ${FIFOresult[1]} misses"),
                      Text(
                          "LRU: ${LRUresult[0]} hits e ${LRUresult[1]} misses"),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
