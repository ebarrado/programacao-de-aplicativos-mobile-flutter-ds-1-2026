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
                "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3ccd3cde-f8c0-480c-ab9d-4db767bda944/dc0txr7-14cb4e25-21fa-49f2-89a5-169067e6b7d1.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiIvZi8zY2NkM2NkZS1mOGMwLTQ4MGMtYWI5ZC00ZGI3NjdiZGE5NDQvZGMwdHhyNy0xNGNiNGUyNS0yMWZhLTQ5ZjItODlhNS0xNjkwNjdlNmI3ZDEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.PiOLUFFt47-autdLfBWGXSaWawJMfh4kU_m_6KscFUQ",
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
