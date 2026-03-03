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
      body: Column(
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
                    colors: [
                      Colors.black,
                      Colors.transparent
                    ]

                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Filme em Destaque",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
