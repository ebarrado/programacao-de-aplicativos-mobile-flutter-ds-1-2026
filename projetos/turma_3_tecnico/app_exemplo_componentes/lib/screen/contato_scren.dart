//importe Material
import 'package:flutter/material.dart';

//class - statells - statefull
//comdando na ide - stl

class ContatoScreen extends StatefulWidget {
  const ContatoScreen({super.key});

  @override
  State<ContatoScreen> createState() => _ContatoScreenState();
}

class _ContatoScreenState extends State<ContatoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criar Contato",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial"
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 181, 245, 6),
        actions: [
          IconButton(
            onPressed: (){

            }, 
            icon: Icon(Icons.more_vert)
            )
        ],
      ) ,
       
    );
  }
}
