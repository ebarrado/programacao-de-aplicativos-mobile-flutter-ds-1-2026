import 'package:flutter/material.dart';

class SpotifyScreem extends StatelessWidget {
  const SpotifyScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Sua Biblioteca",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Icon(Icons.search, color: Colors.white, size: 36, ),
          SizedBox(width: 15),
          IconButton(
            onPressed: () {
              print("Botão Cadastrar pressionado");
            },
            icon: Icon(Icons.add, color: Colors.white, size: 36, ),
          ),
          SizedBox(width: 15),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              print("Perfil Clicado");
            },
            child: CircleAvatar(
              radius: 5,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person,
              size: 36, 
              color: Colors.white),
            ),
          ),
        ),
      ),
      //body
      body:  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4OFsn4NuZe88aI2y_eh2AlsezBwbFqW_0Zw&s",
      width: double.infinity,
      height: 220,
      fit: BoxFit.cover,
      ),

      
      //menu barra de navegação
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: [ 
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Buscar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Sua Biblioteca",
          ),
          ]         
        ),
    );
  }
}
