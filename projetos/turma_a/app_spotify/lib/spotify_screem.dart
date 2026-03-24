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
      body: ListView(
        children: [
          Column(
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
              Container(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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

              SizedBox(height: 10),
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
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsCkVw0o4_eFbiIjmhLFEQ4g7SnOwwqKv_pg&s",
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
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https://portalpopline.com.br/wp-content/uploads/2025/04/albuns-artistas-pop-2025.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //Lista de Albuns com Scroll
              Text(
                "Albuns Internacionais",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgITL3uhopZpAoaytjQbrvxSXbxoFcCEvAMQ&s",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLur6dGKlGkQE2bk2SNbBB6T2wNkCTDYNrLg&s",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRyj8nEPewGzkBzPa-9oNnx4dH4lAow40b2w&s",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBFdm9-ZhNDguQOAFRWljR2mnVqNRA-iMWGg&s",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //Lista de Albuns com Scroll
              Text(
                "Albuns Pop Rock",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZoWdYB9uDkZgCknxXCnFGYy0eseCm67Cb9Q&s",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG8kLv1tBCWTBeb-w6-sxOqUUZ1zMloc_JNA&s",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmuz59JVdS9bY8mBwcYZX7_QZ2R7w6UEdO_A&s",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https://down-br.img.susercontent.com/file/br-11134207-7qukw-li9bcqvk9qut85",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
