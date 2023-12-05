import 'package:flutter/material.dart';
import 'package:so_trab/telamain.dart';

void main() {
  runApp(testeapp());
}

class testeapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red), home: home());
  }
}

class home extends StatefulWidget {
  @override
  State<home> createState() {
    return homeState();
  }
}
