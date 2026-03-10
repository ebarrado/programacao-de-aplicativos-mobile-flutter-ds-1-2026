//PARA CRIAR UMA NOVA CLASSE
//USA O STL
//ANTES IMPORT
import 'package:flutter/material.dart';

class NetflixScreen extends StatelessWidget {
  const NetflixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "NETFLIX",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 15),
          IconButton(
            onPressed: () {
              print("Botao Pressionado");
            },
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Banner
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                "https://cdn.ome.lt/26zLLUG_7jUbUagC-jqNb0ZZtuM=/1200x630/smart/filters:format(webp)/extras/conteudos/BANNER_SITE_FILMES_2025_77LfRPS.png",
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Filme em Destaque",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Populares na Netflix",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
                  height: 180,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc0W55INB9NU6Q4nmZuhtKfA-nu-o62qZVDA&s",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 120,
                  height: 180,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9HsoB4Eqyob40ZRtKhnY4IJPMc2Hamc5qmA&s",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 120,
                  height: 180,
                  child: Image.network(
                    "https://br.web.img2.acsta.net/medias/nmedia/18/95/28/61/20394602.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 120,
                  height: 180,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHkwNDDXiaIcX5ipwHVYUihcBGTyWASSj9Zw&s",
                    fit: BoxFit.cover,
                  ),
                ),
                
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Em Alta na Netflix",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
                  height: 180,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCZ7n0AOff0tmon3ZzRKihinfElfi6ir3dDg&s",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 120,
                  height: 180,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHT6t9LqPG3PcvtvCC1SH3FpDhltaCYRzIlg&s",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 120,
                  height: 180,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ9HXthoueOvsERAZ8wfb7JgA1FStieG9nOw&s",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 120,
                  height: 180,
                  child: Image.network(
                    "https://static.stealthelook.com.br/wp-content/uploads/2023/01/8-series-mais-populares-da-netflix-bridgerton-20230117140513.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Filmes Estrangeiros na Netflix",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
                  height: 180,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLhIwCbwe_4h6N2W2Sij3Br3iEhpq7IgmaAg&s",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 120,
                  height: 180,
                  child: Image.network(
                    "https://static.stealthelook.com.br/wp-content/uploads/2022/01/o-ranking-dos-filmes-mais-assistidos-da-netflix-esquadrao-6-20220113201418.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 120,
                  height: 180,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRdOf_zCMfYbaAIM1UhauKZh83A5HGcmuewQ&s",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 120,
                  height: 180,
                  child: Image.network(
                    "https://media.fstatic.com/gUCCuU0eAINepZii9O34o_OJJ0s=/210x303/smart/filters:format(webp)/media/movies/covers/2018/05/tumblr_oow266lsGh1tc5olbo1_1280.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),)
    );
  }
}
