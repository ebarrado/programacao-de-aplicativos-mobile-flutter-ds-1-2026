import 'package:flutter/material.dart';

class CatalogoFilmeScreen extends StatefulWidget {
  const CatalogoFilmeScreen({super.key});

  @override
  State<CatalogoFilmeScreen> createState() => _CatalogoFilmeScreenState();
}

class _CatalogoFilmeScreenState extends State<CatalogoFilmeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catálogo de Filmes",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial",
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
        leading: Icon(Icons.menu, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: const Color.fromARGB(255, 221, 220, 218),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            "implacavel.jpg",
                            height: 200,
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.amber,
                            child: Row(children: [Text("Nome do Filme")]),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Implacáve (Avengement, 2019), estrelado por Scott Adkins, é um filme de ação e vingança focado em Cain Burgess, um criminoso que foge durante uma saída temporária da prisão. Ele busca vingar-se das pessoas que o transformaram em um assassin",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Icon(Icons.arrow_right)],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
