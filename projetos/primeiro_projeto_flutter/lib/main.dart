import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meu Primeiro App",
      home: Container(
        color: Colors.cyan,
        child: Text(
          "Programando em Flutter",
          style: TextStyle(color: const Color.fromARGB(255, 248, 248, 248)),
        ),
      ),
    ),
  );
}
