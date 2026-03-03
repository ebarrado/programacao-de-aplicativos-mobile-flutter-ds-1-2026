import 'package:flutter/material.dart';

void main(){
  //metodo que chama a tela pra executar
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Center(
        child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 7, 133, 192),
        child: Center(
          child: Text(
            "Primeiro App",
            style: TextStyle(
              color: const Color.fromARGB(255, 13, 14, 13)
            ),
            ),
        ),
            ),
      )
    )
  );
}