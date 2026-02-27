import 'package:flutter/material.dart';

void main(){
  runApp(
    MinhaPrimeiraTela());
}

class MinhaPrimeiraTela extends StatelessWidget {
  const MinhaPrimeiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 230, 18),
          title: Text("WhatsApp",
          style:TextStyle(color: const Color.fromARGB(255, 231, 230, 228)),),
        ),
      ),
    );

      }
}