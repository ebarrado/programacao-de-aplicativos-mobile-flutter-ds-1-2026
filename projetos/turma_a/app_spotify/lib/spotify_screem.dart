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
          Icon(Icons.search, color: Colors.white, size: 36),
          SizedBox(width: 15),
          IconButton(
            onPressed: () {
              print("Botão Cadastrar pressionado");
            },
            icon: Icon(Icons.add, color: Colors.white, size: 36),
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
              child: Icon(Icons.person, size: 36, color: Colors.white),
            ),
          ),
        ),
      ),
      //body
      body: Column(
         
            
        children: [
          Stack(
            children: [
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Spotify_logo_with_text.svg/960px-Spotify_logo_with_text.svg.png",
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
              Container(
                
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          //Lista de Musicas
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.music_note, color: Colors.white),
                  title: Text(
                    "Minha PlayList 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Artista Desconhecido",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.music_note_rounded, color: Colors.white),
                  title: Text(
                    "Pop Internacional",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "Hits Pop",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          //Lista de Albuns com Scroll
          Text(
            "Albuns Nacionais",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:          
          Row(
           
            children: [
              Container(
                margin: EdgeInsets.only(left: 16),
                width: 120,
                height: 120,
                child: Image.network(
                  "https://portalpopline.com.br/wp-content/uploads/2025/04/albuns-artistas-pop-2025.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                width: 120,
                height: 120,
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrBLPfMrHamMoI8G5klGaBKAbHJpD439hNIw&s",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                width: 120,
                height: 120,
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsHO5TiAHo5fD-kzMqKF0Xs5NF6PBuyZ5Gbw&s",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),)
        ],
      ),

      //menu barra de navegação
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Sua Biblioteca",
          ),
        ],
      ),
    );
  }
}
