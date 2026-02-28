//importe Material
import 'package:app_exemplo_componentes/screen/contato_scren.dart';
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
          "AppBar",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 170, 170),
        actions: [
          IconButton(
            tooltip: 'Próxima Página',
            onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder:(context) => ContatoScreen()
                )
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

          )
         ],
        
        ),
      ),
      //BottomNavigatonBar
     bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.amber,
      type: BottomNavigationBarType.shifting,
      items:[
        BottomNavigationBarItem(        
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor:const Color.fromARGB(255, 43, 170, 170),
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
          backgroundColor:const Color.fromARGB(255, 43, 170, 170),
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.set_meal_rounded),
          label: 'Configuração',
          backgroundColor:const Color.fromARGB(255, 43, 170, 170),
          ),
      ],
      ) ,
    );
  }
}
