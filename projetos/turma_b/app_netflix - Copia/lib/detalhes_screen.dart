import 'package:flutter/material.dart';

class DetalhesScreen extends StatelessWidget {
  const DetalhesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Detalhes do Filme",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Arial",
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("https://cdn.ome.lt/26zLLUG_7jUbUagC-jqNb0ZZtuM=/1200x630/smart/filters:format(webp)/extras/conteudos/BANNER_SITE_FILMES_2025_77LfRPS.png",
              width: double.infinity,
              height: 220,
              fit:BoxFit.cover
              ),
              SizedBox(
                height: 20,
              ),
              Text("Filme em Destaque",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(
                height: 10,
              ),
              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14
              ),),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text("Voltar"))
            ],
          ),
        ),
    );
  }
}