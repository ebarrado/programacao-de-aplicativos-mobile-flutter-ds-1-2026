//importe Material
import 'package:app_exemplo_componentes/screen/produto_screen.dart';
import 'package:flutter/material.dart';

//class - statells - statefull
//comdando na ide - stl

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 5, 5),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
            tooltip: 'Próxima Página',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProdutoScreen()),
              );
            },
            icon: Icon(Icons.navigate_next),
          ),
          IconButton(
            tooltip: 'Pesquisar',
            onPressed: () {
              print("Botão Pressionado");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            tooltip: 'Menu Popup',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Esta é uma mensagem padronizada'),
                ),
              );
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      //body
      //----///
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.black),
                Icon(Icons.star, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
      //BottomNavigatonBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        selectedItemColor: const Color.fromARGB(255, 170, 4, 4),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal_rounded),
            label: 'Configuração',
            
          ),
        ],
      ),
    );
  }
}
