import 'package:flutter/material.dart';

void main() {
  runApp(MeuPrimeiroApp());
}

//Classe sem estado com Material APP
class MeuPrimeiroApp extends StatelessWidget {
  const MeuPrimeiroApp({super.key});

  @override
  //Sobreescrever metodo
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "Meu App",
            style: TextStyle(color: Colors.deepOrangeAccent),
          ),
        ),
        body: Center(
          child: Container(
            color: Colors.amber,
            width: 350,
            height: 350,
            child: Container(
              color: Colors.deepPurpleAccent,
              width: 50,
              height: 50,
            ),
          ),
        ),
      ),
    );
  }
}
